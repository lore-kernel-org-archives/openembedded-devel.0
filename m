Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.7408.1614782005120660257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 06:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iA6/g3XW;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bm21so23779641ejb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 06:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xd9ceKbOKcVLawXQajX2YgUobL42NWb884q+5qUSz6c=;
        b=iA6/g3XWV1+gp4xMc+swS2HRSbc8dO6f/rNCyxUHIb93XUGd1Obxx8AoV0zzw1Bv9B
         GO8UDvHCU+ixj16r/YhHx5VH1eBNTLhPcMeOTs2fSx6lKGrYgHpTmyvotwfN3Tw6K2Br
         DeWumEMIVHfyxsLweFNFUx/1gGXfaGelwy+LJertfipWGPBEXCz6fMYdXVyHEqs23K0L
         TQ5Sl2Cal/rkNmYHRjVWLntq2A9IMoaSUPncPL0fDGhXa4rWIzPiDbRMkLIcR1sd//2N
         djp8WYNzyCPRlwh6SQX2n6MiHQDc4WrEv1cxvKO18Bo6VRs56OKzHz1vsp1tRt5Su6J1
         QjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xd9ceKbOKcVLawXQajX2YgUobL42NWb884q+5qUSz6c=;
        b=ajNzr7XA2e27eaHGfll9+zJtqJJ7HVz9DgomOeemwUFPPvxVIt/7Vz7qFygD9ZW/aq
         hQzFw5jKZg8CDM2EQsVXhH1RUEChhXKzOhyS/WMYiBWsmM/Xhn+ur6QNyLORjr97ccbK
         t1bry9Bh0UnymmDSW0Qp0aPNwmD3sQ6CdL91UgbUK6wNfbaZ448ROBJKSXF07bjOc6Wk
         qvYiUqkQS815pzqhJK3nHBdsUhyneshJVEu38m8aEAospJS547tKp4ZDBcnwWCk+ZWwt
         lIBy6rAACeHvwn+6fALo/8mp1fn8oRusxjTwoCWq7PCHqeYtFZEn0MPB/XpS/CAkIne6
         bURQ==
X-Gm-Message-State: AOAM5304uVeNgdVR6AqvnnOXDys4gIqW1S8KZ3EFKa596rRwHGDb1vH9
	enfaZTFeaofuuRccZJAnMq/p66JQTqDC8ZwIXWA=
X-Google-Smtp-Source: ABdhPJwbl75u+K4G+gSF7UsarqNDq4XBoH/NoRUaOljOfhk53XDbwxX9HE4Su1c1uOlCgYPZi4QmrzsmXmkVvpf1ez8=
X-Received: by 2002:a17:906:4349:: with SMTP id z9mr26274422ejm.471.1614782003426;
 Wed, 03 Mar 2021 06:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20210216152349.30824-1-Rahul.Taya@kpit.com> <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
 <BMXPR01MB34313989023828E45EBFAE7BF29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQeuX0JXcWq1WhQEX9mkS67_-ZSpMhsJ-m0ow7JJ3boTgA@mail.gmail.com>
 <BMXPR01MB34313781E1537C2248D69382F29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQe-654P3L1O0D35LsyTiFFgYxt3+o7-d23_x2pzfrUj2w@mail.gmail.com>
 <BMXPR01MB3431C351DFE5682CB4AD905DF29A9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQd1jLHuVEaVxsR=aQ2Pv_qtkGHR3_jpGhJGQdtT8Ujx-w@mail.gmail.com> <BMXPR01MB34318ECB49D8B955CE4CE282F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB34318ECB49D8B955CE4CE282F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 3 Mar 2021 15:33:12 +0100
Message-ID: <CA+chaQfnuA9pUagKVLNZ4Z+O63kpTAPJW_B0eWsjnL6oXgCbHA@mail.gmail.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahul Taya <Rahul.Taya@kpit.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b437fb05bca2bb99"

--000000000000b437fb05bca2bb99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did you run "devtool modify python" twice? If the first call failed to
apply patches you need to go into workspace/sources/python and finish
applying it manually.

But as said in previous e-mails I've already updated your python patch to
apply cleanly (and it's in meta-python2/master-next), so I'm not sure what
you're trying to do now.

On Wed, Mar 3, 2021 at 2:51 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:

> Hi Martin,
>
> Firstlty i run : *devtool modify python*
>
> this command applied all the patches in the source code.
> After this when i run :
>
>          devtool finish --force-patch-refresh <recipe> <layer_path>
>
> where recipe =3D python and layer path =3D /workspace/sources/python
>
> i'm getting message:  *workspace/sources/python appears to be in the
> middle of 'git am' or 'git apply' - please resolve this first*
>
> Can you please help why i'm getting this and how to resolve it ?
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------
> *From:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of Martin Jansa via
> lists.openembedded.org <Martin.Jansa=3Dgmail.com@lists.openembedded.org>
> *Sent:* Monday, March 1, 2021 8:16 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> > Can you please tell me what i should do if a fuzz is detected while
> applying patch or i see some warning message ?
>
> The QA warning/error message about patch-fuzz shows you how to easily
> resolve the fuzz with devtool.
>
> If it doesn't apply at all (like that nghttp2 patch), then you need to
> apply it manually by resolving all conflicts and then refresh the patch
> file (I usually create a git repo in ${S} if it isn't there already from
> SRC_URI, then manually apply the failing patch and then git format-patch
> it).
>
> On Mon, Mar 1, 2021 at 3:26 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> Hi Martin,
>
> Yes i think you are right it can be possible that i overlooked or missed
> the warning.
>
> Can you please tell me what i should do if a fuzz is detected while
> applying patch or i see some warning message ?
>
>
> For nghttp patch please check attached screenshot this is the last messag=
e
> that i saw.
> Can you tell me what next to do for that patch ?
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Thursday, February 25, 2021 10:33 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> Hi Rahul,
>
> you probably don't have patch-fuzz in ERROR_QA and overlooked the warning
> generated by this QA check which is by default only in WARN_QA.
>
> Or you weren't testing it with master branch as the subject says it's for
> dunfell, but it the python version is the same in master and dunfell, so
> the warning should be triggered in both.
>
> On Thu, Feb 25, 2021 at 5:19 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> Hi Martin,
>
> I have tested my changes before sending to you or ML i don=E2=80=99t know=
 why it
> is failing now at your side.
>
> Thanks and Regards,
> Rahul
>
> Get Outlook for iOS
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Faka.=
ms%2Fo0ukef&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc8188f0469240b008=
d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637502068036671086%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&sdata=3DMPfsBf%2BvF%2FG5A8BqZRhXa7VxYOwvA7oSWokj4l%2=
BnBQs%3D&reserved=3D0>
> ------------------------------
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Thursday, February 25, 2021 8:25:50 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> Hi,
>
> normally you should fork meta-python2 and send a link to meta-python2
> change I can cherry-pick, not the blob in otherwise empty repo.
>
> But as I've said in previous reply, I've already manually applied your
> change in meta-python2 master-next where it's now failing:
>
> ERROR: python-native-2.7.18-r0 do_patch: Fuzz detected:
>
> Applying patch CVE-2019-9674.patch
> patching file Doc/library/zipfile.rst
> Hunk #1 succeeded at 554 with fuzz 2 (offset -20 lines).
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify python-native
>     devtool finish --force-patch-refresh python-native <layer_path>
>
> Don't forget to review changes done by devtool!
>
> ERROR: python-native-2.7.18-r0 do_patch: QA Issue: Patch log indicates th=
at patches do not apply cleanly. [patch-fuzz]
>
>
> so I'll fix this as well, but next time please better test your changes (=
nghttp2 patch also didn't apply, see my reply there, not sure if you have f=
ixed that in v2)
>
>
> Regards,
>
>
>
>
> On Thu, Feb 25, 2021 at 9:09 AM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> Hi Martin,
>
> I removed the emoticons and uploaded the patch to my git repo pls access
> below link:
>
> https://github.com/Rahult9/upstream_patch/blob/main/CVE-2019-9674.patch
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2FRahult9%2Fupstream_patch%2Fblob%2Fmain%2FCVE-2019-9674.patch&data=
=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7C353=
9451eb46e4a26a242ff61502855c7%7C0%7C0%7C637502068036681079%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&sdata=3DF8%2BYLk6kzSGFI0Un8Tk3C8pQXhgpbleUkcDhLkhUBRI%3D&reserved=3D=
0>
>
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Thursday, February 18, 2021 10:58 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>;
> Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>;
> Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> "git am" doesn't like those emoticons in the .patch file..
>
> git am ~/py2/cur/16136689*
> error: cannot convert from 8bit to UTF-8
> fatal: could not parse patch
>
> either drop them or upload it to some git repo so I can cherry-pick it
> from there.
>
> On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> For python and python-native added patch to fix
> CVE-2019-9674
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> ---
>  recipes-devtools/python/python.inc            |  1 +
>  .../python/python/CVE-2019-9674.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch
>
> diff --git a/recipes-devtools/python/python.inc
> b/recipes-devtools/python/python.inc
> index a4ba0c5..787f23e 100644
> --- a/recipes-devtools/python/python.inc
> +++ b/recipes-devtools/python/python.inc
> @@ -8,6 +8,7 @@ INC_PR =3D "r1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e759=
642"
>
>  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.p=
ython.org%2Fftp%2Fpython%2F%24%257BPV%257D%2FPython-%24%257BPV%257D.tar.xz&=
data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7=
C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637502068036681079%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&sdata=3DAgwev%2FNAmBIVpMFGVO43e9fodCQDP51na6X9vRcF220%3D&reserve=
d=3D0>
> \
> +           file://CVE-2019-9674.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
> diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch
> b/recipes-devtools/python/python/CVE-2019-9674.patch
> new file mode 100644
> index 0000000..647d9da
> --- /dev/null
> +++ b/recipes-devtools/python/python/CVE-2019-9674.patch
> @@ -0,0 +1,83 @@
> +From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001
> +From: JunWei Song <sungboss2004@gmail.com>
> +Date: Wed, 11 Sep 2019 23:04:12 +0800
> +Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentation
> + (#13378)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-36260: Add pitfalls to zipfile module documentation
> +
> +We saw vulnerability warning description (including zip bomb) in
> Doc/library/xml.rst file.
> +This gave us the idea of documentation improvement.
> +
> +So, we moved a little bit forward :P
> +And the doc patch can be found (pr).
> +
> +* fix trailing whitespace
> +
> +* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
> +
> +* Reformat text for consistency.
> +
> +Upstream-Status: Backport[
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2u=
buntu0~16.04.12.debian.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Farchive=
.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubunt=
u0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc81=
88f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
2068036691075%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DxTmtwvOtDUoFvuP9MyBRE5Majy%2Bc=
qtsU5qhT83ruVuU%3D&reserved=3D0>
> ]
> +CVE: CVE-2019-9674
> +Link:
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2u=
buntu0~16.04.12.debian.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Farchive=
.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubunt=
u0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc81=
88f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
2068036701068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DUSaFhHgPBdg4QgGHYpo9FRhLyBt2Rv=
3pPeOhkVYyhRo%3D&reserved=3D0>
> +Comment: From the original patch skipped changes for file
> +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
> +as this file is not present in our source code.
> +---
> + Doc/library/zipfile.rst                       | 41 +++++++++++++++++++
> + 1 files changed, 41 insertions(+)
> +
> +diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
> +index b421ea5..2e0a91d 100644
> +--- a/Doc/library/zipfile.rst
> ++++ b/Doc/library/zipfile.rst
> +@@ -574,4 +574,45 @@ Instances have the following attributes:
> +
> +    Size of the uncompressed file.
> +
> ++Decompression pitfalls
> ++----------------------
> ++
> ++The extraction in zipfile module might fail due to some pitfalls listed
> below.
> ++
> ++From file itself
> ++~~~~~~~~~~~~~~~~
> ++
> ++Decompression may fail due to incorrect password / CRC checksum / ZIP
> format or
> ++unsupported compression method / decryption.
> ++
> ++File System limitations
> ++~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Exceeding limitations on different file systems can cause decompression
> failed.
> ++Such as allowable characters in the directory entries, length of the
> file name,
> ++length of the pathname, size of a single file, and number of files, etc=
.
> ++
> ++Resources limitations
> ++~~~~~~~~~~~~~~~~~~~~~
> ++
> ++The lack of memory or disk volume would lead to decompression
> ++failed. For example, decompression bombs (aka `ZIP bomb`_)
> ++apply to zipfile library that can cause disk volume exhaustion.
> ++
> ++Interruption
> ++~~~~~~~~~~~~
> ++
> ++Interruption during the decompression, such as pressing control-C or
> killing the
> ++decompression process may result in incomplete decompression of the
> archive.
> ++
> ++Default behaviors of extraction
> ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Not knowing the default extraction behaviors
> ++can cause unexpected decompression results.
> ++For example, when extracting the same archive twice,
> ++it overwrites files without asking.
> ++
> ++
> ++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fen.w=
ikipedia.org%2Fwiki%2FZip_bomb&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793=
cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637502068036701068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DcpU3nEPoLWqOsKeDGTeSDXmMg=
YhKbgh96viKBG%2F%2BD1A%3D&reserved=3D0>
> + .. _PKZIP Application Note:
> https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpkwa=
re.cachefly.net%2Fwebdocs%2Fcasestudies%2FAPPNOTE.TXT&data=3D04%7C01%7CRahu=
l.Taya%40kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637502068036711063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D6r=
6U9Vm9nwtHzdnNnsBEmGw7tAIAot5uWkop%2FbEuKMg%3D&reserved=3D0>
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
>
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>

--000000000000b437fb05bca2bb99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Did you run &quot;devtool modify python&quot; twice? If th=
e first call failed to apply patches you need to go into=C2=A0workspace/sou=
rces/python and finish applying it manually.<div><br></div><div>But as said=
 in previous e-mails I&#39;ve already updated your python patch to apply cl=
eanly (and it&#39;s in meta-python2/master-next), so I&#39;m not sure what =
you&#39;re trying to do now.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 3, 2021 at 2:51 PM Rahul Taya=
 &lt;<a href=3D"mailto:Rahul.Taya@kpit.com">Rahul.Taya@kpit.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi Martin,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Firstlty i run : <b>devtool modify python</b> <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
this command applied all the patches in the source code.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
After this when i run :
<pre>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devtool finish --force-patch-refresh=
 &lt;recipe&gt; &lt;layer_path&gt;</pre>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
where recipe =3D python and layer path =3D /workspace/sources/python<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
i&#39;m getting message:=C2=A0 <b>workspace/sources/python appears to be in=
 the middle of &#39;git am&#39; or &#39;git apply&#39; - please resolve thi=
s first</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<b><br>
</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Can you please help why i&#39;m getting this and how to resolve it ?<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_603417159103648978Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_603417159103648978appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_603417159103648978divRplyFwdMsg" dir=3D"ltr"><font face=
=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From=
:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=
=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"ma=
ilto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openembed=
ded-devel@lists.openembedded.org</a>&gt; on behalf of Martin Jansa via <a h=
ref=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.=
org</a>
 &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Monday, March 1, 2021 8:16 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D"=
_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for=
 CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">&gt;=C2=A0<span style=3D"color:rgb(0,0,0);font-family:Cali=
bri,Arial,Helvetica,sans-serif;font-size:16px">Can you please tell me what =
i should do if a fuzz is detected while applying patch or i see some warnin=
g message ?</span>
<div><span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sa=
ns-serif;font-size:16px"><br>
</span></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
><span style=3D"font-size:16px">The QA warning/error message about patch-fu=
zz shows you how to easily resolve the fuzz with devtool.</span></font></di=
v>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
><span style=3D"font-size:16px"><br>
</span></font></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
><span style=3D"font-size:16px">If it doesn&#39;t apply at all (like that n=
ghttp2 patch), then you need to apply it manually by resolving all conflict=
s and then refresh the patch file (I usually
 create a git repo in ${S} if it isn&#39;t there already from SRC_URI, then=
 manually apply the failing patch and then git format-patch it).</span></fo=
nt></div>
</div>
<br>
<div>
<div dir=3D"ltr">On Mon, Mar 1, 2021 at 3:26 PM Rahul Taya &lt;<a href=3D"m=
ailto:Rahul.Taya@kpit.com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt; wr=
ote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi Martin,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Yes i think you are right it can be possible that i overlooked or missed th=
e warning.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Can you please tell me what i should do if a fuzz is detected while applyin=
g patch or i see some warning message ?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
For nghttp patch please check attached screenshot this is the last message =
that i saw.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Can you tell me what next to do for that patch ?<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786Signature=
">
<div>
<div></div>
<div name=3D"x_divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786appendons=
end"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786divRplyFw=
dMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" color=3D"#000000" styl=
e=3D"font-size:11pt"><b>From:</b> Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, February 25, 2021 10:33 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D"=
_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for=
 CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">Hi Rahul,
<div><br>
</div>
<div>you probably don&#39;t have patch-fuzz in ERROR_QA and overlooked the =
warning generated by this QA check which is by default only in WARN_QA.</di=
v>
<div><br>
</div>
<div>Or you weren&#39;t testing it with master branch as the subject says i=
t&#39;s for dunfell, but it the python version is the same in master and du=
nfell, so the warning should be triggered in both.</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Feb 25, 2021 at 5:19 PM Rahul Taya &lt;<a href=3D"=
mailto:Rahul.Taya@kpit.com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt; w=
rote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div>
<div>
<div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">Hi Martin,</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"><br>
</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">I have tested my changes before sending to you or ML=C2=A0<span style=3D=
"font-size:inherit">i don=E2=80=99t know why it is failing now at your side=
.</span></div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)"><span style=3D"font-size:inherit"><br>
</span></div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">Thanks and Regards,</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">Rahul</div>
</div>
<div><br>
</div>
<div>Get <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Faka.ms%2Fo0ukef&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C7=
93cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637502068036671086%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DMPfsBf%2BvF%2FG5A8B=
qZRhXa7VxYOwvA7oSWokj4l%2BnBQs%3D&amp;reserved=3D0" target=3D"_blank">
Outlook for iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786x_gmail-m=
_8535883728496035522divRplyFwdMsg" dir=3D"ltr">
<font face=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11p=
t"><b>From:</b> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, February 25, 2021 8:25:50 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D"=
_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for=
 CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div>normally you should fork meta-python2 and send a link to meta-python2 =
change I can cherry-pick, not the blob in otherwise empty repo.</div>
<div><br>
</div>
<div>But as I&#39;ve said in previous reply, I&#39;ve already manually appl=
ied your change in meta-python2 master-next where it&#39;s now failing:</di=
v>
<div><br>
</div>
<div>
<pre style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51)">ERROR: python-native-2.7.18-r0 do_patch: F=
uzz detected:

Applying patch CVE-2019-9674.patch
patching file Doc/library/zipfile.rst
Hunk #1 succeeded at 554 with fuzz 2 (offset -20 lines).


The context lines in the patches can be updated with devtool:

    devtool modify python-native
    devtool finish --force-patch-refresh python-native &lt;layer_path&gt;

Don&#39;t forget to review changes done by devtool!

ERROR: python-native-2.7.18-r0 do_patch: QA Issue: Patch log indicates that=
 patches do not apply cleanly. [patch-fuzz]</pre>
<pre style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51)"><br></pre>
<pre style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51)">so I&#39;ll fix this as well, but next tim=
e please better test your changes (nghttp2 patch also didn&#39;t apply, see=
 my reply there, not sure if you have fixed that in v2)</pre>
<pre style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51)"><br></pre>
<pre style=3D"box-sizing:inherit;white-space:pre-wrap;margin-top:0px;margin=
-bottom:0px;color:rgb(51,51,51)">Regards,</pre>
</div>
<div></div>
<div><br>
</div>
<div><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Feb 25, 2021 at 9:09 AM Rahul Taya &lt;<a href=3D"=
mailto:Rahul.Taya@kpit.com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt; w=
rote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi Martin,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
I removed the emoticons and uploaded the patch to my git repo pls access be=
low link:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<span title=3D"https://github.com/Rahult9/upstream_patch/blob/main/CVE-2019=
-9674.patch"><span><a href=3D"https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FRahult9%2Fupstream_patch%2Fblob%2Fmain%=
2FCVE-2019-9674.patch&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc81=
88f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
2068036681079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DF8%2BYLk6kzSGFI0Un8Tk3C8pQ=
XhgpbleUkcDhLkhUBRI%3D&amp;reserved=3D0" id=3D"gmail-m_603417159103648978x_=
gmail-m_1797946359111992786x_gmail-m_8535883728496035522x_gmail-m_-23174397=
10916735757LPlnk" target=3D"_blank">https://github.com/Rahult9/upstream_pat=
ch/blob/main/CVE-2019-9674.patch</a></span></span><br>
</div>
<div></div>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786x_gmail-m=
_8535883728496035522x_gmail-m_-2317439710916735757Signature">
<div>
<div></div>
<div name=3D"x_x_x_divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786x_gmail-m=
_8535883728496035522x_gmail-m_-2317439710916735757appendonsend">
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_603417159103648978x_gmail-m_1797946359111992786x_gmail-m=
_8535883728496035522x_gmail-m_-2317439710916735757divRplyFwdMsg" dir=3D"ltr=
">
<font face=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11p=
t"><b>From:</b> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, February 18, 2021 10:58 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D"=
_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a>&gt;; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;; Nisha Parrakat &lt;<a href=3D"mailto:Ni=
sha.Parrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&gt;;
 Harpritkaur Bhandari &lt;<a href=3D"mailto:Harpritkaur.Bhandari@kpit.com" =
target=3D"_blank">Harpritkaur.Bhandari@kpit.com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for=
 CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">&quot;git am&quot; doesn&#39;t like those emoticons in the=
 .patch file..
<div><br>
</div>
<div>git am ~/py2/cur/16136689*<br>
error: cannot convert from 8bit to UTF-8<br>
fatal: could not parse patch<br>
</div>
<div><br>
</div>
<div>either drop them or upload it to some git repo so I can cherry-pick it=
 from there.</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya &lt;<a href=3D"=
mailto:Rahul.Taya@kpit.com" target=3D"_blank">Rahul.Taya@kpit.com</a>&gt; w=
rote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
For python and python-native added patch to fix<br>
CVE-2019-9674<br>
<br>
Signed-off-by: Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=
=3D"_blank">Rahul.Taya@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
=C2=A0.../python/python/CVE-2019-9674.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 83 +++++++++++++++++++<br>
=C2=A02 files changed, 84 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch=
<br>
<br>
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/p=
ython.inc<br>
index a4ba0c5..787f23e 100644<br>
--- a/recipes-devtools/python/python.inc<br>
+++ b/recipes-devtools/python/python.inc<br>
@@ -8,6 +8,7 @@ INC_PR =3D &quot;r1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D203a6dbc802ee896020a4=
7161e759642&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://apc01.safelinks.protection.outlo=
ok.com/?url=3Dhttp%3A%2F%2Fwww.python.org%2Fftp%2Fpython%2F%24%257BPV%257D%=
2FPython-%24%257BPV%257D.tar.xz&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%=
7C793cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637502068036681079%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAgwev%2FNAmBIVpM=
FGVO43e9fodCQDP51na6X9vRcF220%3D&amp;reserved=3D0" rel=3D"noreferrer" targe=
t=3D"_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a>
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-9674.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b62c0e7937551d0cc02b8fd5cb0f544f9405bafc=
9a54d3808ed4594812edef43&quot;<br>
diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/recipes-d=
evtools/python/python/CVE-2019-9674.patch<br>
new file mode 100644<br>
index 0000000..647d9da<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/python/CVE-2019-9674.patch<br>
@@ -0,0 +1,83 @@<br>
+From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001<br>
+From: JunWei Song &lt;<a href=3D"mailto:sungboss2004@gmail.com" target=3D"=
_blank">sungboss2004@gmail.com</a>&gt;<br>
+Date: Wed, 11 Sep 2019 23:04:12 +0800<br>
+Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentation<b=
r>
+ (#13378)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* bpo-36260: Add pitfalls to zipfile module documentation<br>
+<br>
+We saw vulnerability warning description (including zip bomb) in Doc/libra=
ry/xml.rst file.<br>
+This gave us the idea of documentation improvement.<br>
+<br>
+So, we moved a little bit forward :P<br>
+And the doc patch can be found (pr).<br>
+<br>
+* fix trailing whitespace<br>
+<br>
+* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.<br>
+<br>
+* Reformat text for consistency.<br>
+<br>
+Upstream-Status: Backport[<a href=3D"https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttp:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2=
Fpython3.5%2Fpython3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&amp;data=3D04%=
7C01%7CRahul.Taya%40kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637502068036691075%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DxTmtwvOtDUoFvuP9MyBRE5Majy%2BcqtsU5qhT83ruVuU%3D&amp;reserved=
=3D0" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu=
/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz</a>]=
<br>
+CVE: CVE-2019-9674<br>
+Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
p:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3=
.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&amp;data=3D04%7C01%7CRahul.Taya%40=
kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637502068036701068%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DUSaFhHg=
PBdg4QgGHYpo9FRhLyBt2Rv3pPeOhkVYyhRo%3D&amp;reserved=3D0" rel=3D"noreferrer=
" target=3D"_blank">
http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ubu=
ntu0~16.04.12.debian.tar.xz</a><br>
+Comment: From the original patch skipped changes for file<br>
+Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst<br=
>
+as this file is not present in our source code.<br>
+---<br>
+ Doc/library/zipfile.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++++++++++++++++++<br>
+ 1 files changed, 41 insertions(+)<br>
+<br>
+diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst<br>
+index b421ea5..2e0a91d 100644<br>
+--- a/Doc/library/zipfile.rst<br>
++++ b/Doc/library/zipfile.rst<br>
+@@ -574,4 +574,45 @@ Instances have the following attributes:<br>
+<br>
+=C2=A0 =C2=A0 Size of the uncompressed file.<br>
+<br>
++Decompression pitfalls<br>
++----------------------<br>
++<br>
++The extraction in zipfile module might fail due to some pitfalls listed b=
elow.<br>
++<br>
++From file itself<br>
++~~~~~~~~~~~~~~~~<br>
++<br>
++Decompression may fail due to incorrect password / CRC checksum / ZIP for=
mat or<br>
++unsupported compression method / decryption.<br>
++<br>
++File System limitations<br>
++~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Exceeding limitations on different file systems can cause decompression f=
ailed.<br>
++Such as allowable characters in the directory entries, length of the file=
 name,<br>
++length of the pathname, size of a single file, and number of files, etc.<=
br>
++<br>
++Resources limitations<br>
++~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++The lack of memory or disk volume would lead to decompression<br>
++failed. For example, decompression bombs (aka `ZIP bomb`_)<br>
++apply to zipfile library that can cause disk volume exhaustion.<br>
++<br>
++Interruption<br>
++~~~~~~~~~~~~<br>
++<br>
++Interruption during the decompression, such as pressing control-C or kill=
ing the<br>
++decompression process may result in incomplete decompression of the archi=
ve.<br>
++<br>
++Default behaviors of extraction<br>
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Not knowing the default extraction behaviors<br>
++can cause unexpected decompression results.<br>
++For example, when extracting the same archive twice,<br>
++it overwrites files without asking.<br>
++<br>
++<br>
++.. _ZIP bomb: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fen.wikipedia.org%2Fwiki%2FZip_bomb&amp;data=3D04%7C01%7=
CRahul.Taya%40kpit.com%7C793cbc8188f0469240b008d8dcc0d2a7%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637502068036701068%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DcpU3nEPoLWqOsKeDGTeSDXmMgYhKbgh96viKBG%2F%2BD1A%3D&amp;reserved=3D0"=
 rel=3D"noreferrer" target=3D"_blank">
https://en.wikipedia.org/wiki/Zip_bomb</a><br>
+ .. _PKZIP Application Note: <a href=3D"https://apc01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fpkware.cachefly.net%2Fwebdocs%2Fcasestudi=
es%2FAPPNOTE.TXT&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C793cbc8188f04=
69240b008d8dcc0d2a7%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375020680=
36711063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D6r6U9Vm9nwtHzdnNnsBEmGw7tAIAot5=
uWkop%2FbEuKMg%3D&amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">
https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT</a><br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails. </div>
</blockquote>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails. </div>
</blockquote>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails. </div>
</blockquote>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</div>

</blockquote></div>

--000000000000b437fb05bca2bb99--
