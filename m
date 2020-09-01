Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.7564.1598997606635519503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nq6/y2Q6;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l21so2949055eds.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xTmVb1SFVSWO4XdXhsEokeXvNSMzH3boFaGrNIhi/l4=;
        b=nq6/y2Q69YdYauNQGPlws9SYJnDTTuHuyf5UpQVsFb7R5X/vlS1HaOMdmcoxOMvk/N
         OcBNbNmLGNshbmuxqaBHxSmd9tSxZJpYK+aJyEKqaghpOz+17TnzDyFDGejNY0m6h4H6
         RXcMoR/lK8G7ZUfRsrp1s6X1VzXymsRE7tldX/wQZoJoShe3+yEyVLI5Wz4IPV7JhK19
         AuuO0tqkD1fsVXSh4WV9BJfCk1rEul2XOGnB7DVcyQngt6uLcJqZIBRwOvNvpPRPmfA3
         58CP31js6mAh9aCbzPrfvy7NjXgt6GRHsKFkQge8vcaZWlJxZuz7aFMd4BmXXlSAvnZR
         vtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xTmVb1SFVSWO4XdXhsEokeXvNSMzH3boFaGrNIhi/l4=;
        b=RQBj7UOWDhcH5w84yAlC04Wjpof44GjHyQlnrDbTF/NRrXUzJrdhbRWAJgf9jXT0z5
         wb7FKiYSUpmg7VXFMGsQ5SeCj9IgWM2vyB15/ev0EZJZh92gXGoPyTGKi/iMVv57/ebi
         z/U1UIpSammLxQ9dEB41ylXs815T7PbWNSqYdt1CIw+6DY7xaFr1vM0WRra/RW+/v+5V
         vA1kQsAn4R+ul6XTTcP7Zal1Zk5zSg7vXJsWrT8ELjPFV2MnDCYbKeJRT/8dolAbVu/x
         SeDXfKhsSzzroWG/t1hkkeVlo5iB0O1QmiHvph+yIDXwi2soVxkS1VZuVVZVIEBsuUDW
         ix5g==
X-Gm-Message-State: AOAM531rzltastkcWOhDzd3xJUmbKVJDkc/tn0wJKFiEgs4PeIeEFg0X
	Os2U0+wRV9YZ6KVdD96cXaO+TCJLgvSVB4EMqgE=
X-Google-Smtp-Source: ABdhPJzoBogqASzl6dPp73KcxOoDoeACAKGratFzR+E22zPwfZ6CYCWpO1i+R2mUnRBTuw2u8tS0RhIROgHFafCTop4=
X-Received: by 2002:a50:954d:: with SMTP id v13mr3810697eda.337.1598997604963;
 Tue, 01 Sep 2020 15:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <162F7E2FF7270601.30808@lists.openembedded.org>
 <20200828190134.2359034-1-Martin.Jansa@gmail.com> <20200831074505.GC2162@korppu>
In-Reply-To: <20200831074505.GC2162@korppu>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 1 Sep 2020 23:59:53 +0200
Message-ID: <CA+chaQeDapJQj666nDQqhWc-hD1tQ7OPZH9YzZ-1g+RJ_=fVmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nss: fix postinst in do_rootfs for target
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003d991a05ae47a4e2"

--0000000000003d991a05ae47a4e2
Content-Type: text/plain; charset="UTF-8"

Looks like my "solution" also isn't working well at least for images with
read-only-rootfs in IMAGE_FEATURES.

pkg_postinst_ontarget_${PN} is always forced to run on the target, which
for read-only-rootfs results in:
log.do_rootfs:
...
NOTE: If an image is being built, the postinstalls for the following
packages will be postponed for first boot: nss
...
ERROR: The following packages could not be configured offline and rootfs is
read-only: ['nss']

and now looking at the /usr/bin/signlibs.sh:

CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
SIGN_BINARY=`which shlibsign`
for I in $CHK_FILES
do
       DN=`dirname $I`
       BN=`basename $I .chk`
       FN=$DN/$BN.so
       $SIGN_BINARY -i $FN
done

it does pretty much the same as the postinst script when D isn't empty.

From oe-core git history it shows that signlibs.sh was added first:
https://git.openembedded.org/openembedded-core/commit/?id=a4580f967c8064294a06d406acf5deb24aee2acc
then the offline version of postinst was added to support read-only-rootfs
in:
https://git.openembedded.org/openembedded-core/commit/?id=64e87fc6e99bc1d4807034166735034b1f92bad8
and nss-native should always provide the shlibsign since:
https://git.openembedded.org/openembedded-core/commit/?id=88540c5b08dea069660d1a68e506aebdd68e6ae0
and only after
https://git.openembedded.org/openembedded-core/commit/?id=8f782f7095e718dd9452055af53363beb6bdbece
it looked like signlibs.sh was something special only for target.

So it looks to me, that we should just remove signlibs.sh script and let
the same postinst be used on target and offline
(with or without D being empty).

Cheers,

On Mon, Aug 31, 2020 at 9:45 AM <Mikko.Rapeli@bmw.de> wrote:

> Hi,
>
> On Fri, Aug 28, 2020 at 09:01:34PM +0200, Martin Jansa wrote:
> > Partially revert "nss: fix postinst script for nativesdk build"
> >
> > This reverts commit 31552510b15c1c97aa6cbe180c2bb53d139efbcc.
> >
> > When running in do_rootfs we need to run shlibsign provided
> > by nss-native, otherwise it fails when /usr/bin/shlibsign
> > doesn't exist on host builder:
> >
> > do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the
> intention is to defer them to first boot,
> > then please place them into pkg_postinst_ontarget_${PN} ().
> > Deferring to first boot via 'exit 1' is no longer supported.
>
> Thanks for this, it fixes all issues.
>
> I didn't properly test my patch. Sorry!
>
> -Mikko
>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/nss/nss_3.54.bb | 26 ++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> b/meta-oe/recipes-support/nss/nss_3.54.bb
> > index 882145c1ef..81b2538813 100644
> > --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> > +++ b/meta-oe/recipes-support/nss/nss_3.54.bb
> > @@ -240,19 +240,19 @@ do_install_append_class-target() {
> >
> >  PACKAGE_WRITE_DEPS += "nss-native"
> >  pkg_postinst_${PN} () {
> > -    if [ -n "$D" ]; then
> > -        for I in $D${libdir}/lib*.chk; do
> > -            DN=`dirname $I`
> > -            BN=`basename $I .chk`
> > -            FN=$DN/$BN.so
> > -            ${bindir}/shlibsign -i $FN
> > -            if [ $? -ne 0 ]; then
> > -                exit 1
> > -            fi
> > -        done
> > -    else
> > -        ${bindir}/signlibs.sh
> > -    fi
> > +    for I in $D${libdir}/lib*.chk; do
> > +        DN=`dirname $I`
> > +        BN=`basename $I .chk`
> > +        FN=$DN/$BN.so
> > +        shlibsign -i $FN
> > +        if [ $? -ne 0 ]; then
> > +            echo "shlibsign -i $FN failed"
> > +        fi
> > +    done
> > +}
> > +
> > +pkg_postinst_ontarget_${PN} () {
> > +    ${bindir}/signlibs.sh
> >  }
> >
> >  PACKAGES =+ "${PN}-smime"
> > --
> > 2.25.1
> >
>
> > 
>

--0000000000003d991a05ae47a4e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Looks like my &quot;solution&quot; also i=
sn&#39;t working well at least for images with read-only-rootfs in IMAGE_FE=
ATURES.<div><br></div><div>pkg_postinst_ontarget_${PN} is always forced to =
run on the target, which for read-only-rootfs results in:<br></div><div>log=
.do_rootfs:</div><div>...</div><div>NOTE: If an image is being built, the p=
ostinstalls for the following packages will be postponed for first boot: ns=
s<br></div><div>...</div><div>ERROR: The following packages could not be co=
nfigured offline and rootfs is read-only: [&#39;nss&#39;]<br></div><div><br=
></div><div>and now looking at the=C2=A0/usr/bin/signlibs.sh:</div><div><br=
></div><div>CHK_FILES=3D`ls /lib*/*.chk /usr/lib*/*.chk 2&gt;/dev/null`<br>=
SIGN_BINARY=3D`which shlibsign`<br>for I in $CHK_FILES<br>do<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0DN=3D`dirname $I`<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0BN=3D`bas=
ename $I .chk`<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0FN=3D$DN/$BN.so<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0$SIGN_BINARY -i $FN<br>done<br></div><div><br></div><div>=
it does pretty much the same as the postinst script when D isn&#39;t empty.=
</div><div><br></div><div>From oe-core git history it shows that signlibs.s=
h was added first:</div><div><a href=3D"https://git.openembedded.org/openem=
bedded-core/commit/?id=3Da4580f967c8064294a06d406acf5deb24aee2acc">https://=
git.openembedded.org/openembedded-core/commit/?id=3Da4580f967c8064294a06d40=
6acf5deb24aee2acc</a><br></div><div>then the offline version of postinst wa=
s added to support read-only-rootfs in:</div><div><a href=3D"https://git.op=
enembedded.org/openembedded-core/commit/?id=3D64e87fc6e99bc1d48070341667350=
34b1f92bad8">https://git.openembedded.org/openembedded-core/commit/?id=3D64=
e87fc6e99bc1d4807034166735034b1f92bad8</a><br></div><div>and nss-native sho=
uld always provide the shlibsign=C2=A0since:</div><div><a href=3D"https://g=
it.openembedded.org/openembedded-core/commit/?id=3D88540c5b08dea069660d1a68=
e506aebdd68e6ae0">https://git.openembedded.org/openembedded-core/commit/?id=
=
=3D88540c5b08dea069660d1a68e506aebdd68e6ae0</a><br></div><div>and only aft=
er<br></div><div><a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D8f782f7095e718dd9452055af53363beb6bdbece">https://git.openembe=
dded.org/openembedded-core/commit/?id=3D8f782f7095e718dd9452055af53363beb6b=
dbece</a><br></div><div>it looked like signlibs.sh was something special on=
ly for target.</div><div><br></div><div>So it looks to me, that we should j=
ust remove=C2=A0signlibs.sh script and let the same postinst be used on tar=
get and offline</div><div>(with or without D being empty).</div><div><br></=
div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Aug 31, 2020 at 9:45 AM &lt;<a href=3D"mailto=
:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Fri, Aug 28, 2020 at 09:01:34PM +0200, Martin Jansa wrote:<br>
&gt; Partially revert &quot;nss: fix postinst script for nativesdk build&q=
uot;<br>
&gt; <br>
&gt; This reverts commit 31552510b15c1c97aa6cbe180c2bb53d139efbcc.<br>
&gt; <br>
&gt; When running in do_rootfs we need to run shlibsign provided<br>
&gt; by nss-native, otherwise it fails when /usr/bin/shlibsign<br>
&gt; doesn&#39;t exist on host builder:<br>
&gt; <br>
&gt; do_rootfs: Postinstall scriptlets of [&#39;nss&#39;] have failed. If =
the intention is to defer them to first boot,<br>
&gt; then please place them into pkg_postinst_ontarget_${PN} ().<br>
&gt; Deferring to first boot via &#39;exit 1&#39; is no longer supported.<=
br>
<br>
Thanks for this, it fixes all issues.<br>
<br>
I didn&#39;t properly test my patch. Sorry!<br>
<br>
-Mikko<br>
<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> | 26 ++++++++++++-------=
------<br>
&gt;=C2=A0 1 file changed, 13 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.b=
b" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> b/meta-oe/recipes-s=
upport/nss/<a href=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nss_3.54.bb</a><br>
&gt; index 882145c1ef..81b2538813 100644<br>
&gt; --- a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a><br>
&gt; @@ -240,19 +240,19 @@ do_install_append_class-target() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_WRITE_DEPS +=3D &quot;nss-native&quot;<br>
&gt;=C2=A0 pkg_postinst_${PN} () {<br>
&gt; -=C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for I in $D${libdir}/lib*.chk; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DN=3D`dirname $I`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BN=3D`basename $I .chk`<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FN=3D$DN/$BN.so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/shlibsign -i $FN=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; -=C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/signlibs.sh<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 for I in $D${libdir}/lib*.chk; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DN=3D`dirname $I`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BN=3D`basename $I .chk`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 FN=3D$DN/$BN.so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shlibsign -i $FN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;shlibsign -i $F=
N failed&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +}<br>
&gt; +<br>
&gt; +pkg_postinst_ontarget_${PN} () {<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/signlibs.sh<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-smime&quot;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
&gt; <br>
</blockquote></div></div>

--0000000000003d991a05ae47a4e2--
