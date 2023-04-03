Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE27C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 17:58:26 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.78715.1680544696992761922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 10:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Drokte0r;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id d3so7930149ybu.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680544696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m9zQn2GY7R//U6sMRU4sEmAlUz6c3JxdXODEFdofXX4=;
        b=Drokte0rpo0Ebnq8aoyp9QJICWyqz8fbr2MzXLVoy3RiZIU86prx0FxrhimFfJkbqC
         emg0ZyQ6e70CGpC73l9e4AX6zNQIhxhdVqTxCunajuOaUMyfVc4M8ZZQtarj8JHsyBrb
         Qc9KgYLj2rJTj+bMdvVs0FgfAhUEBYL+c6xMjMlUvoaJAGf6UhPdx0WObwNtCRODU6JW
         brYq0n+6aniy1kVgn/6v3YVw1nEej51rPCLeZRWuEgsf4nnqEs5lbHEurcJXR4fQpINc
         uKzpNi1mPAzvp14iKIzyYJ8r5RRuSbf7rpVlnCBGjRlW2P/g665tLkt3Pr50KbVqMWbI
         t7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9zQn2GY7R//U6sMRU4sEmAlUz6c3JxdXODEFdofXX4=;
        b=t8GIN/Vp+715Fcg5Y6rhwJ/cdRh5wPktmNn1hGyMaGr9LspjO5UPDBNOcR4hpG4ZgG
         9ZZAVJt5b+yz3VayRnHj7n7X9Su5gtABRuKonImpXSSe1eLX1o9krVisUpECN0dgqTeg
         7FvIj65ctF8H85mqoLnWR8Z7gY+Q6Nd1vmO74aTW60h7zJguv9CBhEqggWRKwC6yNFLG
         7i08dWB4fAqttZ+LlCraJ/79eC1e9hrQYnsJ/LBe43tq435wpOWKtKRwl5loy78CwysV
         HYfDQf2YJLOQnW7k9m/FZbMRaKk95270zcMZfzycLmlJbLM3JLSxXhguRI7x6biu31r1
         m3EA==
X-Gm-Message-State: AAQBX9f5b80OmIRNnEfmxFdkCyY1+pmVJ3IghvlSmK7gSarSwq7C4thV
	k8XtzyulwFsVAuhdYJtrNoluUHDKT7hSGXNxaWs=
X-Google-Smtp-Source: AKy350Zef6w3+c6X0VD8tkG5wQtB6HzV5d/W55xHgQjdZ0WmByHi8HKtny3+ERJ+K3fAc7Z/v5OHr67giJtDxUbLaIM=
X-Received: by 2002:a25:d897:0:b0:b21:5fb4:c6e6 with SMTP id
 p145-20020a25d897000000b00b215fb4c6e6mr34871ybg.11.1680544695735; Mon, 03 Apr
 2023 10:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680473253.git.tim.orling@konsulko.com> <040cff75f5cc2f926c6ab489c0a4b1776ce7d17d.1680473253.git.tim.orling@konsulko.com>
 <CAMKF1sqVHAb9gzjaW96OLtJGr4ALAZU6NZKTFaxXX4RYnBPYBg@mail.gmail.com>
In-Reply-To: <CAMKF1sqVHAb9gzjaW96OLtJGr4ALAZU6NZKTFaxXX4RYnBPYBg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Apr 2023 10:58:04 -0700
Message-ID: <CANx9H-DLAvXN3Fja8-4g8yvtFYfMyBsR+onQoHQPnUROeCTuWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 04/11] meta-oe-ptest*-image: enable
 BBCLASSEXTEND parallel execution
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e599705f8724d4e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 17:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101943

--0000000000009e599705f8724d4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 2, 2023 at 9:13=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> Thanks for this patchset Tim, really appreciate it. I have few comments.
>
> On Sun, Apr 2, 2023 at 3:30=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> > Similar to "core-image-ptest: Switch to BBCLASSEXTEND parallel executio=
n"
> >
> > Refactor meta-oe-ptest-image.bb for an image per ptest in the form of
> > meta-oe-ptest-image-XXX using class extensions.
> >
> > * Add meta-oe-ptest-all-image.bb depends on ALL meta-oe-ptest-image-XXX
> in meta-oe
> > * Add meta-oe-ptest-fast-image.bb depends on meta-oe ptests which take
> less than ~30s
> >
> > This allows parallel execution of the tests.
> >
> > The downside to this approach is the parsing time of an image generatin=
g
> > this number of class extensions is slow but making it easier to execute
> > and collect test data should outweigh that.
> >
> > A useful advantage is that the dependencies of each ptest package are
> > checked/tested individually.
> >
> > Add to local.conf:
> > IMAGE_CLASSES +=3D "testimage"
> >
> > All the meta-oe-ptest-image-XXX can be built with:
> > $ bitbake meta-oe-ptest-all-image
> >
> > Subsequently, all the ptest images can be run with:
> > $ bitbake -c testimage meta-oe-ptest-all-image
> >
> > You will likely want to limit the number of parallel image tests:
> >
> > BB_NUMBER_THREADS =3D "4"
> >
> > based on the number of TAP devices you have defined or the number of
> simultaneous
> > QEMU sessions your server can support.
> >
> > Results can be summarized with:
> >
> > $ resulttool report tmp/log/oeqa/testresult.json
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  .../images/meta-oe-ptest-all-image.bb         | 25 ++++++++++++
> >  .../images/meta-oe-ptest-fast-image.bb        |  6 +++
> >  .../images/meta-oe-ptest-image.bb             | 38 ++++++++++++++++++-
> >  3 files changed, 68 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-core/images/
> meta-oe-ptest-all-image.bb
> >  create mode 100644 meta-oe/recipes-core/images/
> meta-oe-ptest-fast-image.bb
>
> I think these images also need ( and also the ones in meta-python and
> meta-perl too I think )
>
> IMAGE_FEATURES +=3D "debug-tweaks"
>
> since some of them add ssh and it will be helpful to be able to do
> passwordless access.


I was mirroring the setup in oe-core. The default local.conf.sample in poky
enables
debug-tweaks and that is what I used as well as what the AutoBuilder uses.

The question is do we want to enforce a hard requirement on 'debug-tweaks'
when
some users may want to test in a different environment with a defined
user/password or
with ssh keys added to known_hosts, etc. Food for thought and I am open to
the change.


> and I was also wondering
> if meta-oe-image-base.bb is really needed. We could simply include
> core-image-base.bb here.


I was trying to do minimal change to what was already there. Open to the
change.


> This change also makes
> meta-oe-image.bb and packagegroup-meta-oe.bb also questionable. Since
> build part can be taken care by bitbake world.
> but we can address that later.


Again, I was trying to make only the changes to enable this new "per image
ptest" methodology. I personally
never used meta-oe-image.bb, meta-python-image.bb nor meta-perl-image.bb. I
am open to dropping them if
we decide to drop the packagegroups (which are TBH a bit of a challenge
since they are not necessarily always
up to date). In case others were using these for their workflows, I did not
want to cause breakage without some
discussion.

I will note that meta-oe-ptest-image.bb, meta-python-ptest-image.bb and
meta-perl-ptest-image.bb are all currently
needed in order to have layer isolation of the ptests. In
core-image-ptest.bb, the PTESTS variable is set and
I did not want to clobber that. Hence the new PTESTS_META_OE and friends
variables.

I'll also note that I tried to enable the "missing-ptest" QA check from
ptest.bbclass, but this is a per recipe check (not
an image level check) and is currently hard coded to only look at
meta/conf/distro/include/ptest-packagelists.inc and the
PTESTS_FAST and PTESTS_SLOW variables defined there. I didn't immediately
come up with a way to modularize that
behavior.


>
>
> > diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
> b/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
> > new file mode 100644
> > index 000000000..0ea03dd2e
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/images/meta-oe-ptest-all-image.bb
> > @@ -0,0 +1,25 @@
> > +DESCRIPTION =3D "Recipe to trigger execution of all meta-oe ptest imag=
es."
> > +HOMEPAGE =3D "https://www.openembedded.org/"
> > +
> > +LICENSE =3D "MIT"
> > +
> > +inherit features_check nopackages
> > +REQUIRED_DISTRO_FEATURES =3D "ptest"
> > +
> > +require conf/include/ptest-packagelists-meta-oe.inc
> > +
> > +# Include the full set of ptests
> > +PTESTS_META_OE =3D "${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE}"
> > +
> > +do_testimage[noexec] =3D "1"
> > +do_testimage[depends] =3D "${@'
> '.join(['meta-oe-ptest-image-'+x+':do_testimage' for x in
> d.getVar('PTESTS_META_OE').split()])}"
> > +
> > +do_build[depends] =3D "${@' '.join(['meta-oe-ptest-image-'+x+':do_buil=
d'
> for x in d.getVar('PTESTS_META_OE').split()])}"
> > +
> > +# normally image.bbclass would do this
> > +EXCLUDE_FROM_WORLD =3D "1"
> > +
> > +python () {
> > +    if bb.utils.contains('IMAGE_CLASSES', 'testimage', True, False, d)=
:
> > +        bb.build.addtask("do_testimage", "", "", d)
> > +}
> > diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
> b/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
> > new file mode 100644
> > index 000000000..f56e841ff
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/images/meta-oe-ptest-fast-image.bb
> > @@ -0,0 +1,6 @@
> > +require meta-oe-ptest-all-image.bb
> > +
> > +DESCRIPTION =3D "Recipe to trigger execution of all fast meta-oe ptest
> images."
> > +
> > +PTESTS_META_OE =3D "${PTESTS_FAST_META_OE}"
> > +
> > diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> > index 0166b9c41..951d91f82 100644
> > --- a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> > +++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
> > @@ -1,5 +1,41 @@
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES =3D "ptest"
> > +
> > +require conf/include/ptest-packagelists-meta-oe.inc
> > +
> >  require  meta-oe-image-base.bb
> >
> >  SUMMARY =3D "meta-oe ptest test image"
> >
> > -IMAGE_INSTALL +=3D "packagegroup-meta-oe"
> > +DESCRIPTION +=3D "Also including the ${MCNAME} ptest package."
> > +HOMEPAGE =3D "https://www.openembedded.org/"
> > +
> > +PTESTS_META_OE =3D "${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE}"
> > +
> > +IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
> > +
> > +BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x in
> d.getVar('PTESTS_META_OE').split()])}"
> > +
> > +# The image can be sufficiently large (~1.8GB) that we need to be
> careful that it fits in a live
> > +# image (which has a 4GB limit), so nullify the overhead factor (1.3x
> out of the
> > +# box) and explicitly add up to 1500MB.
> > +IMAGE_OVERHEAD_FACTOR =3D "1.0"
> > +IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
> > +# If a particular ptest needs more space, it can be customized:
> > +#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-<pn> =3D "1024288"
> > +
> > +# ptests need more memory than standard to avoid the OOM killer
> > +QB_MEM =3D "-m 1024"
> > +# If a particular ptest needs more memroy, it can be customized:
> > +#QB_MEM:virtclass-mcextend-<pn> =3D "-m 4096"
> > +
> > +TEST_SUITES =3D "ping ssh parselogs ptest"
> > +
> > +# Sadly at the moment the full set of ptests is not robust enough and
> sporadically fails in random places
> > +PTEST_EXPECT_FAILURE =3D "1"
> > +
> > +python () {
> > +    if not d.getVar("MCNAME"):
> > +        raise bb.parse.SkipRecipe("No class extension set")
> > +}
> > +
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101882):
> https://lists.openembedded.org/g/openembedded-devel/message/101882
> > Mute This Topic: https://lists.openembedded.org/mt/98023314/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000009e599705f8724d4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 2, 2023 at 9:13=E2=80=AFP=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Than=
ks for this patchset Tim, really appreciate it. I have few comments.<br>
<br>
On Sun, Apr 2, 2023 at 3:30=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Similar to &quot;core-image-ptest: Switch to BBCLASSEXTEND parallel ex=
ecution&quot;<br>
&gt;<br>
&gt; Refactor <a href=3D"http://meta-oe-ptest-image.bb" rel=3D"noreferrer" =
target=3D"_blank">meta-oe-ptest-image.bb</a> for an image per ptest in the =
form of<br>
&gt; meta-oe-ptest-image-XXX using class extensions.<br>
&gt;<br>
&gt; * Add <a href=3D"http://meta-oe-ptest-all-image.bb" rel=3D"noreferrer"=
 target=3D"_blank">meta-oe-ptest-all-image.bb</a> depends on ALL meta-oe-pt=
est-image-XXX in meta-oe<br>
&gt; * Add <a href=3D"http://meta-oe-ptest-fast-image.bb" rel=3D"noreferrer=
" target=3D"_blank">meta-oe-ptest-fast-image.bb</a> depends on meta-oe ptes=
ts which take less than ~30s<br>
&gt;<br>
&gt; This allows parallel execution of the tests.<br>
&gt;<br>
&gt; The downside to this approach is the parsing time of an image generati=
ng<br>
&gt; this number of class extensions is slow but making it easier to execut=
e<br>
&gt; and collect test data should outweigh that.<br>
&gt;<br>
&gt; A useful advantage is that the dependencies of each ptest package are<=
br>
&gt; checked/tested individually.<br>
&gt;<br>
&gt; Add to local.conf:<br>
&gt; IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
&gt;<br>
&gt; All the meta-oe-ptest-image-XXX can be built with:<br>
&gt; $ bitbake meta-oe-ptest-all-image<br>
&gt;<br>
&gt; Subsequently, all the ptest images can be run with:<br>
&gt; $ bitbake -c testimage meta-oe-ptest-all-image<br>
&gt;<br>
&gt; You will likely want to limit the number of parallel image tests:<br>
&gt;<br>
&gt; BB_NUMBER_THREADS =3D &quot;4&quot;<br>
&gt;<br>
&gt; based on the number of TAP devices you have defined or the number of s=
imultaneous<br>
&gt; QEMU sessions your server can support.<br>
&gt;<br>
&gt; Results can be summarized with:<br>
&gt;<br>
&gt; $ resulttool report tmp/log/oeqa/testresult.json<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../images/<a href=3D"http://meta-oe-ptest-all-image.bb" rel=3D"=
noreferrer" target=3D"_blank">meta-oe-ptest-all-image.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++<br>
&gt;=C2=A0 .../images/<a href=3D"http://meta-oe-ptest-fast-image.bb" rel=3D=
"noreferrer" target=3D"_blank">meta-oe-ptest-fast-image.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
&gt;=C2=A0 .../images/<a href=3D"http://meta-oe-ptest-image.bb" rel=3D"nore=
ferrer" target=3D"_blank">meta-oe-ptest-image.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 38 ++++++++++++++++++-<br>
&gt;=C2=A0 3 files changed, 68 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-core/images/<a href=3D"http:/=
/meta-oe-ptest-all-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-p=
test-all-image.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-core/images/<a href=3D"http:/=
/meta-oe-ptest-fast-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-=
ptest-fast-image.bb</a><br>
<br>
I think these images also need ( and also the ones in meta-python and<br>
meta-perl too I think )<br>
<br>
IMAGE_FEATURES +=3D &quot;debug-tweaks&quot;<br>
<br>
since some of them add ssh and it will be helpful to be able to do<br>
passwordless access. </blockquote><div><br></div><div>I was mirroring the s=
etup in oe-core. The default local.conf.sample in poky enables</div><div>de=
bug-tweaks and that is what I used as well as what the AutoBuilder uses.</d=
iv><div><br></div><div>The question is do we want to enforce a hard require=
ment on &#39;debug-tweaks&#39; when</div><div>some users may want to test i=
n a different environment with a defined user/password or</div><div>with ss=
h keys added to known_hosts, etc. Food for thought and I am open to the cha=
nge.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">and I was also wondering<br>
if <a href=3D"http://meta-oe-image-base.bb" rel=3D"noreferrer" target=3D"_b=
lank">meta-oe-image-base.bb</a> is really needed. We could simply include<b=
r>
<a href=3D"http://core-image-base.bb" rel=3D"noreferrer" target=3D"_blank">=
core-image-base.bb</a> here. </blockquote><div><br></div><div>I was trying =
to do minimal change to what was already there. Open to the change.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This chang=
e also makes<br>
<a href=3D"http://meta-oe-image.bb" rel=3D"noreferrer" target=3D"_blank">me=
ta-oe-image.bb</a> and <a href=3D"http://packagegroup-meta-oe.bb" rel=3D"no=
referrer" target=3D"_blank">packagegroup-meta-oe.bb</a> also questionable. =
Since<br>
build part can be taken care by bitbake world.<br>
but we can address that later.</blockquote><div><br></div><div>Again, I was=
 trying to make only the changes to enable this new &quot;per image ptest&q=
uot; methodology. I personally</div><div>never used <a href=3D"http://meta-=
oe-image.bb">meta-oe-image.bb</a>, <a href=3D"http://meta-python-image.bb">=
meta-python-image.bb</a> nor <a href=3D"http://meta-perl-image.bb">meta-per=
l-image.bb</a>. I am open to dropping them if</div><div>we decide to drop t=
he packagegroups=C2=A0(which are TBH a bit of a challenge since they are no=
t necessarily always</div><div>up to date). In case others were using these=
 for their workflows, I did not want to cause breakage without some</div><d=
iv>discussion.</div><div><br></div><div>I will note that <a href=3D"http://=
meta-oe-ptest-image.bb">meta-oe-ptest-image.bb</a>, <a href=3D"http://meta-=
python-ptest-image.bb">meta-python-ptest-image.bb</a> and <a href=3D"http:/=
/meta-perl-ptest-image.bb">meta-perl-ptest-image.bb</a> are all currently</=
div><div>needed in order to have layer isolation of the ptests. In <a href=
=3D"http://core-image-ptest.bb">core-image-ptest.bb</a>, the PTESTS variabl=
e is set and</div><div>I did not want to clobber that. Hence the new PTESTS=
_META_OE and friends variables.</div><div><br></div><div>I&#39;ll also note=
 that I tried to enable the &quot;missing-ptest&quot; QA check from ptest.b=
bclass, but this is a per recipe check (not</div><div>an image level check)=
 and is currently hard coded to only look at meta/conf/distro/include/ptest=
-packagelists.inc and the</div><div>PTESTS_FAST and PTESTS_SLOW variables d=
efined there. I didn&#39;t immediately come up with a way to modularize tha=
t</div><div>behavior.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;<br>
&gt; diff --git a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-pte=
st-all-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-all-ima=
ge.bb</a> b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-all=
-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-all-image.bb<=
/a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..0ea03dd2e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-all-=
image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-all-image.bb</=
a><br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +DESCRIPTION =3D &quot;Recipe to trigger execution of all meta-oe ptes=
t images.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.openembedded.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.openembedded.org/</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +<br>
&gt; +inherit features_check nopackages<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;ptest&quot;<br>
&gt; +<br>
&gt; +require conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; +<br>
&gt; +# Include the full set of ptests<br>
&gt; +PTESTS_META_OE =3D &quot;${PTESTS_FAST_META_OE} ${PTESTS_SLOW_META_OE=
}&quot;<br>
&gt; +<br>
&gt; +do_testimage[noexec] =3D &quot;1&quot;<br>
&gt; +do_testimage[depends] =3D &quot;${@&#39; &#39;.join([&#39;meta-oe-pte=
st-image-&#39;+x+&#39;:do_testimage&#39; for x in d.getVar(&#39;PTESTS_META=
_OE&#39;).split()])}&quot;<br>
&gt; +<br>
&gt; +do_build[depends] =3D &quot;${@&#39; &#39;.join([&#39;meta-oe-ptest-i=
mage-&#39;+x+&#39;:do_build&#39; for x in d.getVar(&#39;PTESTS_META_OE&#39;=
).split()])}&quot;<br>
&gt; +<br>
&gt; +# normally image.bbclass would do this<br>
&gt; +EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 if bb.utils.contains(&#39;IMAGE_CLASSES&#39;, &#39;test=
image&#39;, True, False, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&quot;do_testimage&quot;=
, &quot;&quot;, &quot;&quot;, d)<br>
&gt; +}<br>
&gt; diff --git a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-pte=
st-fast-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-fast-i=
mage.bb</a> b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-f=
ast-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-fast-image=
.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..f56e841ff<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-fast=
-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-fast-image.bb=
</a><br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +require <a href=3D"http://meta-oe-ptest-all-image.bb" rel=3D"noreferr=
er" target=3D"_blank">meta-oe-ptest-all-image.bb</a><br>
&gt; +<br>
&gt; +DESCRIPTION =3D &quot;Recipe to trigger execution of all fast meta-oe=
 ptest images.&quot;<br>
&gt; +<br>
&gt; +PTESTS_META_OE =3D &quot;${PTESTS_FAST_META_OE}&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-pte=
st-image.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-image.bb</a=
> b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-image.bb" r=
el=3D"noreferrer" target=3D"_blank">meta-oe-ptest-image.bb</a><br>
&gt; index 0166b9c41..951d91f82 100644<br>
&gt; --- a/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-imag=
e.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-image.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/images/<a href=3D"http://meta-oe-ptest-imag=
e.bb" rel=3D"noreferrer" target=3D"_blank">meta-oe-ptest-image.bb</a><br>
&gt; @@ -1,5 +1,41 @@<br>
&gt; +inherit features_check<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;ptest&quot;<br>
&gt; +<br>
&gt; +require conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; +<br>
&gt;=C2=A0 require=C2=A0 <a href=3D"http://meta-oe-image-base.bb" rel=3D"no=
referrer" target=3D"_blank">meta-oe-image-base.bb</a><br>
&gt;<br>
&gt;=C2=A0 SUMMARY =3D &quot;meta-oe ptest test image&quot;<br>
&gt;<br>
&gt; -IMAGE_INSTALL +=3D &quot;packagegroup-meta-oe&quot;<br>
&gt; +DESCRIPTION +=3D &quot;Also including the ${MCNAME} ptest package.&qu=
ot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.openembedded.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.openembedded.org/</a>&quot;<br>
&gt; +<br>
&gt; +PTESTS_META_OE =3D &quot;${PTESTS_SLOW_META_OE} ${PTESTS_FAST_META_OE=
}&quot;<br>
&gt; +<br>
&gt; +IMAGE_INSTALL:append =3D &quot; ${MCNAME}-ptest openssh&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;${@&#39; &#39;.join([&#39;mcextend:&#39;+x fo=
r x in d.getVar(&#39;PTESTS_META_OE&#39;).split()])}&quot;<br>
&gt; +<br>
&gt; +# The image can be sufficiently large (~1.8GB) that we need to be car=
eful that it fits in a live<br>
&gt; +# image (which has a 4GB limit), so nullify the overhead factor (1.3x=
 out of the<br>
&gt; +# box) and explicitly add up to 1500MB.<br>
&gt; +IMAGE_OVERHEAD_FACTOR =3D &quot;1.0&quot;<br>
&gt; +IMAGE_ROOTFS_EXTRA_SPACE =3D &quot;324288&quot;<br>
&gt; +# If a particular ptest needs more space, it can be customized:<br>
&gt; +#IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-&lt;pn&gt; =3D &quot;102=
4288&quot;<br>
&gt; +<br>
&gt; +# ptests need more memory than standard to avoid the OOM killer<br>
&gt; +QB_MEM =3D &quot;-m 1024&quot;<br>
&gt; +# If a particular ptest needs more memroy, it can be customized:<br>
&gt; +#QB_MEM:virtclass-mcextend-&lt;pn&gt; =3D &quot;-m 4096&quot;<br>
&gt; +<br>
&gt; +TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
&gt; +<br>
&gt; +# Sadly at the moment the full set of ptests is not robust enough and=
 sporadically fails in random places<br>
&gt; +PTEST_EXPECT_FAILURE =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 if not d.getVar(&quot;MCNAME&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;No class =
extension set&quot;)<br>
&gt; +}<br>
&gt; +<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#101882): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/101882" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/101882</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98023314=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98023314/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000009e599705f8724d4e--

