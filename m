Return-Path: <venkattalluri5559@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A709C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 11:01:20 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.3970.1662634873790213940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 04:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IKdtgmif;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: venkattalluri5559@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id g14so12497678qto.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gYBcLubQ+vhtvFi7M3giZZ+/voVhXi3ZeZi0Qbp08RU=;
        b=IKdtgmifu5wdgCdUPGs1l76QwD5ig6Rl1G5LjZjdw5sgkU5opuqXbyGDxMuZjXyukH
         alLMfr9eqXf+vDPUrPWi7sUPZ7yKbHa6xkZG5RNZsDTlB+ET9rDngNnzx4ayY1Qh43LB
         7JFFcB0gn8YzJYODW8FCC3VkWlaWgYZM+Fi4u/nRYosG/MtRV92WwVVmFcI17vwtPtcL
         WmBIyLnBlb+O9b4oyqZJxPIj8Lj7SWu2K1pk2BI0TOOqyJFKXz8w35XCt9o08uTnrXvE
         WfjpkKAaI5E6jiVY/benwB5nTgZ4g/EYlI/7nSi3S59ZGB2fNk2yWvUmF/CjRIuVogSz
         25Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gYBcLubQ+vhtvFi7M3giZZ+/voVhXi3ZeZi0Qbp08RU=;
        b=nxgQZH92bZ+9TT4dR7NCavIZNtrSViNxSSHZuF0EKsAzfuU2f3SrDzwcXjUo15+V/Y
         hyOOTgParHlMPghhwSzpnw/HheOkKqObadno9Q5WfQGELEu56nrl+bOVe7lnQboDj+wj
         OJYbAsLAi7/MaogpPMvXMlBdsh+M66sENpux5JlTDzvgYhOuUhFDtN97rINGWYQVEKDa
         TQ/b/2EmkE4cYhpnrkrURGCpLzXZz+EMZ6HqxVLsbOJ6ptYgRq6//xIS9Y8Bxtl8Mydp
         504q9m8Yj+nP3SJwJbfvfw9NgT7y6+a/sLyXjPjmXCoUsIS+CwnEEf8yvi+zFHShLJHN
         w2QQ==
X-Gm-Message-State: ACgBeo2yRpmW4HjxXpM3cAnLtbLaNkJAgCxDifO7noeuAXwv86k1zyif
	V5o43f3zFy5PfjD+YPGtrywS3vImThwViNoaUhnH9tXLPiE=
X-Google-Smtp-Source: 
 AA6agR6bWUCP9XJD/adLSZRLmjyMWcpAfw6Bi5jCdKlKLH2QdOMF29VZJxKV1Dhbod+ajynAckWSPcBhT7vnd6GQPP0=
X-Received: by 2002:a05:622a:14e:b0:344:5e1d:3189 with SMTP id
 v14-20020a05622a014e00b003445e1d3189mr7306295qtw.316.1662634872698; Thu, 08
 Sep 2022 04:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220907171023.31485-1-virendra.thakur@kpit.com>
In-Reply-To: <20220907171023.31485-1-virendra.thakur@kpit.com>
From: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Date: Thu, 8 Sep 2022 16:31:01 +0530
Message-ID: 
 <CABbzySa=-pYPHw91ju_ity25PLUjNzg8L96_qhG=VtkzYfdgQg@mail.gmail.com>
Subject: Re: [oe][meta-java][dunfell][PATCH ] cacao-initial-native: exclude
 BB_NUMBER_THREADS from sstate hash
To: virendra.thakur@kpit.com
Cc: openembedded-devel@lists.openembedded.org,
	Virendra Thakur <virendrak@kpit.com>
Content-Type: multipart/mixed; boundary="000000000000fab95805e8285870"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 11:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98720

--000000000000fab95805e8285870
Content-Type: multipart/alternative; boundary="000000000000fab95605e828586e"

--000000000000fab95605e828586e
Content-Type: text/plain; charset="UTF-8"

Hi All,

I'm trying to build sysbench_1.0.20.bb on QCS610 codebase but I'm getting
following error so can you please help me to solve this issue.
Image:qti-multimedia-image
Target:qcs610-odk-64

Error log:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'luajit' (but
/var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/qti-multimedia-image.bb
RDEPENDS on or otherwise requires it)
luajit was skipped: incompatible with host aarch64-oe-linux (not in
COMPATIBLE_HOST)
NOTE: Runtime target 'luajit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['luajit']
ERROR: Required build target 'qti-multimedia-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['qti-multimedia-image', 'luajit']


Please find the attached sysbench_1.0.20.bb file.


Thanks,

Venkata Talluri


On Wed, Sep 7, 2022 at 10:40 PM Virendra Thakur via lists.openembedded.org
<virendra.thakur=kpit.com@lists.openembedded.org> wrote:

> From: Virendra Thakur <virendrak@kpit.com>
>
> The sstate-cache for cacao-initial-native is not shareable across
> multiple machines because the parallelisation configuration of Bitbake
> is being embedded into the sstate hash of cacao-initial-native.
>
> Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
> this issue.
>
> Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.
>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  recipes-core/cacao/cacao-initial-native_0.98.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb
> b/recipes-core/cacao/cacao-initial-native_0.98.bb
> index 8432456..1bf822d 100644
> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
> @@ -40,5 +40,7 @@ do_configure:append() {
>    sed -i -e "s|exec cacao \\$|exec cacao-initial \\$|" src/scripts/
> java.in
>  }
>
> +do_compile[vardepsexclude] += "BB_NUMBER_THREADS"
> +
>  SRC_URI[md5sum] = "8b8907c8b925761c9410bcadb9705346"
>  SRC_URI[sha256sum] =
> "cb9363add825cedf77764fc49a223aaf43f0a9f485b711ba8c92f16b13fff188"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98690):
> https://lists.openembedded.org/g/openembedded-devel/message/98690
> Mute This Topic: https://lists.openembedded.org/mt/93529818/7150353
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> venkattalluri5559@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fab95605e828586e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I&#39;m trying to bu=
ild <a href=3D"http://sysbench_1.0.20.bb">sysbench_1.0.20.bb</a> on QCS610 =
codebase but I&#39;m getting following error so can you please help me to s=
olve this issue.</div><div>Image:qti-multimedia-image <br></div><div>Target=
:qcs610-odk-64<br></div><div><br></div><div>Error log:</div><div><pre class=
=3D"gmail-console-output">NOTE: Resolving any missing task queue dependenci=
es
ERROR: Nothing RPROVIDES &#39;luajit&#39; (but /var/lib/jenkins/workspace/Q=
CS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/pok=
y/meta-qti-bsp/recipes-products/images/<a href=3D"http://qti-multimedia-ima=
ge.bb">qti-multimedia-image.bb</a> RDEPENDS on or otherwise requires it)
luajit was skipped: incompatible with host aarch64-oe-linux (not in COMPATI=
BLE_HOST)
NOTE: Runtime target &#39;luajit&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;luajit&#39;]
ERROR: Required build target &#39;qti-multimedia-image&#39; has no buildabl=
e providers.
Missing or unbuildable dependency chain was: [&#39;qti-multimedia-image&#39=
;, &#39;luajit&#39;]<br><br><br></pre><pre class=3D"gmail-console-output">P=
lease find the attached <a href=3D"http://sysbench_1.0.20.bb">sysbench_1.0.=
20.bb</a> file.<br><br><br></pre><pre class=3D"gmail-console-output">Thanks=
,<br></pre><pre class=3D"gmail-console-output">Venkata Talluri<br></pre></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Sep 7, 2022 at 10:40 PM Virendra Thakur via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;virendra.thakur=3D<a h=
ref=3D"mailto:kpit.com@lists.openembedded.org">kpit.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Virendra Thakur &lt;<a href=3D"mailto:virendrak@kpit.com" target=
=3D"_blank">virendrak@kpit.com</a>&gt;<br>
<br>
The sstate-cache for cacao-initial-native is not shareable across<br>
multiple machines because the parallelisation configuration of Bitbake<br>
is being embedded into the sstate hash of cacao-initial-native.<br>
<br>
Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid<br>
this issue.<br>
<br>
Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.<br>
<br>
Signed-off-by: Virendra Thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb</a> | 2 ++<=
br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98=
.bb" rel=3D"noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb</a> =
b/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" rel=3D=
"noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb</a><br>
index 8432456..1bf822d 100644<br>
--- a/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb</a><br>
+++ b/recipes-core/cacao/<a href=3D"http://cacao-initial-native_0.98.bb" re=
l=3D"noreferrer" target=3D"_blank">cacao-initial-native_0.98.bb</a><br>
@@ -40,5 +40,7 @@ do_configure:append() {<br>
=C2=A0 =C2=A0sed -i -e &quot;s|exec cacao \\$|exec cacao-initial \\$|&quot;=
 src/scripts/<a href=3D"http://java.in" rel=3D"noreferrer" target=3D"_blank=
">java.in</a><br>
=C2=A0}<br>
<br>
+do_compile[vardepsexclude] +=3D &quot;BB_NUMBER_THREADS&quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;8b8907c8b925761c9410bcadb9705346&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;cb9363add825cedf77764fc49a223aaf43f0a9f4=
85b711ba8c92f16b13fff188&quot;<br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98690): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98690" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98690</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93529818/7150=
353" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93529818/7150353</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:venkattalluri5559@gmail.=
com" target=3D"_blank">venkattalluri5559@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fab95605e828586e--

--000000000000fab95805e8285870
Content-Type: application/octet-stream; name="sysbench_1.0.20.bb"
Content-Disposition: attachment; filename="sysbench_1.0.20.bb"
Content-Transfer-Encoding: base64
Content-ID: <f_l7sxl33p0>
X-Attachment-Id: f_l7sxl33p0

U1VNTUFSWSA9ICJTeXN0ZW0gcGVyZm9ybWFuY2UgYmVuY2htYXJrIgpIT01FUEFHRSA9ICJodHRw
Oi8vZ2l0aHViLmNvbS9ha29weXRvdi9zeXNiZW5jaCIKU0VDVElPTiA9ICJjb25zb2xlL3Rlc3Rz
IgpMSUNFTlNFID0gIkdQTHYyIgpMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKCkRFUEVORFMgPSAibHVhaml0IgoK
IyBUaGUgcHJvamVjdCBoYXMgbW92ZWQgZnJvbSBTb3VyY2Vmb3JnZSB0byBMYXVuY2hwYWQsIHRv
IEdpdGh1Yi4gVXNlIHRoZSBzb3VyY2UgdGFyYmFsbCBmcm9tCiMgTGF1bmNocGFkIHVudGlsIHRo
ZSBuZXh0IHJlbGVhc2UgaXMgYXZhaWxhYmxlIGZyb20gR2l0aHViLgojU1JDX1VSSSA9ICJodHRw
czovL2xhdW5jaHBhZC5uZXQvdWJ1bnR1LythcmNoaXZlL3ByaW1hcnkvK2ZpbGVzLyR7QlBOfV8k
e1BWfS5vcmlnLnRhci5neiI7CmluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwoKI1NSQ19VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL2Frb3B5dG92L3N5c2JlbmNoL2FyY2hpdmUvcmVmcy90YWdz
LyR7UFZ9LnRhci5neiIKU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Frb3B5dG92LyR7QlBO
fS5naXQiCgpTUkNSRVYgPSAiZWJmMWM5MGRhMDVkZWE5NDY0ODE2NWU0ZjE0OWFiYzIwYzk3OTU1
NyIKClMgPSAiJHtXT1JLRElSfS9naXQiCgojU1JDX1VSSVttZDVzdW1dID0gIjc1NjM4MWM2ZmM0
ZTE2YWYxZTA4MzFiNWU2YTNkY2IzIgojU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ZWU3OWIxZjM5
OWIyZDE2N2U2YTkwZGU1MmNjYzkwZTUyNDA4ZjdhZGUxYjliNzEzNTcyN2VmZTE4MTM0N2YiCgpQ
QUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAn
bGFyZ2VmaWxlJywgZCl9IgpQQUNLQUdFQ09ORklHW2xhcmdlZmlsZV0gPSAiLS1lbmFibGUtbGFy
Z2VmaWxlLC0tZGlzYWJsZS1sYXJnZWZpbGUsLCIKI1BBQ0tBR0VDT05GSUdbYWlvXSA9ICItLWVu
YWJsZS1haW8sLS1kaXNhYmxlLWFpbyxsaWJhaW8sIgpQQUNLQUdFQ09ORklHW215c3FsXSA9ICIt
LXdpdGgtbXlzcWwgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGgtbXlzcWwtbGlicz0k
e1NUQUdJTkdfTElCRElSfSwgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGhvdXQtbXlz
cWwsbXlzcWw1IgoKIyB0aGUgaW50ZXJuYWwgbHVhaml0IHdvbid0IGNyb3NzIGNvbXBpbGUKRVhU
UkFfT0VDT05GICs9ICItLXdpdGgtc3lzdGVtLWx1YWppdCIKCiMgbHVhLmggZ2VuZXJhdGVkIGZp
bGVzIGFyZSBib2d1cyB3aGVuIHVzaW5nIEIgIT0gUwpCID0gIiR7U30iCgpkb19jb25maWd1cmVf
cHJlcGVuZCgpIHsKICAgIHRvdWNoICR7U30vTkVXUyAke1N9L0FVVEhPUlMKfQo=
--000000000000fab95805e8285870--

