Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.8607.1614786755696355702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LfQbvEmn;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id do6so43187066ejc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tmPqzOU0HqPsYyp7GwrnyfxYEOivVIq8AjBUlswesM=;
        b=LfQbvEmn0fE+e05VrOnPORqOj8BUv/zjf91cZRZORXNZLSL4Ggyhzq+PrvwdBbrfsC
         1sg8fgY1PjxsL/pMrcS+XWyQJpU+8GxCXKCGUNyUhwxmhIy+V8Nd6Ix33K5rcWLNwrkZ
         MnyBUAtTpAcj1VOLYR3qr2Y+GyEaMddQvJpIDAqBSEffoMrN9ME9iC+/m02nqNKPRk5s
         JW3825OMPBlxq1059T95QBOWiKhkTOdaCsTtQFQWFnI+SMIltVYy6tluJMcA6+vVJheI
         TG9/YblEQJaz2cxNFEZp31YRks/y+u/eHWohJosqWnwgew9y3toGMBJloml+YbVHA2uK
         9vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tmPqzOU0HqPsYyp7GwrnyfxYEOivVIq8AjBUlswesM=;
        b=afWTpvP58Fc8BJ0BuAdW3LWePerju69zFlUmgm/1zW0+/EOSm80I3xRez/NN2XOL7H
         Gqw6NLBN3D5983vbUSgv6VwjZnYLwRcuMWYReE0Bz+oR4CfDioLo+bIv8k09i2SUleiX
         AOhECWo5IJfI1OLha/Ww3rUMEMimPAkBh8q+h3XXspTXgyGvSUdQNg5GFrCUYUpr4V5l
         nyKCfq5wlksmg7QvL+Jdsa1TpwFdYeCqam08kceg2wjfOrmo6Hu4XUzPDLPns4EV6Elu
         1Lx0zT1us2zxhsqdJXjrLsAYbkI/SwYZtevMbTnIb9K+FGfypIRgsWWmn0u/AjZCdP8C
         xZtw==
X-Gm-Message-State: AOAM530bnTz1DAcSo5FOhyCk4MpBbu7fOPs+17SwUPMQ1WecRrsCNd8g
	dJsMPFQAcJpyfemdxkXF8jBGJOiGG6MeCmjkil8=
X-Google-Smtp-Source: ABdhPJzfe/C4CnCxPn6T9SS5d+O6YCfS+U3NBmt1cl1sGaq/9rlcp1Qger1soKCtOpIcDC2kySBMsvHFdEKSSkdsJhs=
X-Received: by 2002:a17:906:9bc8:: with SMTP id de8mr20641125ejc.470.1614786754158;
 Wed, 03 Mar 2021 07:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20210216152349.30824-1-Rahul.Taya@kpit.com> <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
 <BMXPR01MB34313989023828E45EBFAE7BF29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQeuX0JXcWq1WhQEX9mkS67_-ZSpMhsJ-m0ow7JJ3boTgA@mail.gmail.com>
 <BMXPR01MB34313781E1537C2248D69382F29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQe-654P3L1O0D35LsyTiFFgYxt3+o7-d23_x2pzfrUj2w@mail.gmail.com>
 <BMXPR01MB3431C351DFE5682CB4AD905DF29A9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQd1jLHuVEaVxsR=aQ2Pv_qtkGHR3_jpGhJGQdtT8Ujx-w@mail.gmail.com>
 <BMXPR01MB34318ECB49D8B955CE4CE282F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQfnuA9pUagKVLNZ4Z+O63kpTAPJW_B0eWsjnL6oXgCbHA@mail.gmail.com> <BMXPR01MB3431C751D5DCF36F6DC7B1C1F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB3431C751D5DCF36F6DC7B1C1F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 3 Mar 2021 16:52:22 +0100
Message-ID: <CA+chaQcFZCPLySJTy4pAnSDNOk2rRr77RPJ5TmaWWyfN6QWP4g@mail.gmail.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahul Taya <Rahul.Taya@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>, Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000dead9305bca3d601"

--000000000000dead9305bca3d601
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 4:26 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:

> Hi Martin,
>
> No i run devtool modify python only once and it applies the patch in
> source file.
>

Then you had to run "git am" manually in this directory and never finish?
you need to finish it or all git am --abort when you give up.

What i=E2=80=99 m not getting is how i generate a patch after this.
>  By taking git diff b/w the original source file and the patched file or
> what?
>

either "git format-patch" when you have applied the patch manually or
"devtool finish --force-patch-refresh ..." will call "git format-patch" for
you when devtool was able to apply the patch with just a fuzz.

Anyway you're still expected to review the changes in regenerated patch to
confirm that it still does what it was supposed to do.

Yes martin you applied my patch in master-next which is also required for
> dunfell.As i have other patches too i.e CVE-2019-20907 for python that i
> have sent and nghttp2 patch that=E2=80=99s why i thought to fix their war=
nings
> also using devtool and then send to you for applying.
>

I've already applied CVE-2019-20907 as well and fixed the patch-fuzz there,
will push it to master-next as well. I'll push it to gatesgarth-next and
dunfell-next as well.

And for nghttp2 patch I've sent the fix as well, see:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/du=
nfell&id=3D3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0
which I've sent when your version of the patch was in dunfell-next, see:
https://lists.openembedded.org/g/openembedded-devel/message/89628

+oe-devel ML

*From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Wednesday, March 3, 2021 8:03:12 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>
> Did you run "devtool modify python" twice? If the first call failed to
> apply patches you need to go into workspace/sources/python and finish
> applying it manually.
>
> But as said in previous e-mails I've already updated your python patch to
> apply cleanly (and it's in meta-python2/master-next), so I'm not sure wha=
t
> you're trying to do now.
>
> On Wed, Mar 3, 2021 at 2:51 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
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
> lists.openembedded.org
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.openembedded.org%2F&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274=
d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375037880=
90869534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DJCevxk14rWrYeYG6NMjCKbEc%2FGV%2FAPj=
F%2FsyKHGa0vcw%3D&reserved=3D0>
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org>
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
ms%2Fo0ukef&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274d86d5dc08=
d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503788090879514%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&sdata=3D8qwZgjGzXSFBpHQtW9NXg8Z2ndlebOn7CGMbUvCco9Y%=
3D&reserved=3D0>
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
=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C353=
9451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503788090879514%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&sdata=3DeWAfxq3RnC58UC2fOdvLq%2BZ%2BdEqMY2jC4UC7QLVd7ow%3D&reserved=
=3D0>
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
data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7=
C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503788090889508%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&sdata=3Da78O00g99NZRFABWXJxxEnYi0XNXth%2Bz%2FKSkSQHXWWg%3D&reser=
ved=3D0>
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
u0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43c=
bc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
3788090889508%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D8WNO3k087HhZTbusKgNIz90vEXsLPF=
vvWYPAhBOZia0%3D&reserved=3D0>
> ]
> +CVE: CVE-2019-9674
> +Link:
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2u=
buntu0~16.04.12.debian.tar.xz
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Farchive=
.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubunt=
u0~16.04.12.debian.tar.xz&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43c=
bc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
3788090899497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DKVUivnPgsPMCcdqJYV2Zz4Xv1jdVaP=
vVoFNQtFl7RoQ%3D&reserved=3D0>
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
ikipedia.org%2Fwiki%2FZip_bomb&data=3D04%7C01%7CRahul.Taya%40kpit.com%7C919=
3c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637503788090909491%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DyjgmXUObjQ3krrxYAcJ3351km=
YUXBrDqWalvmaY4wxY%3D&reserved=3D0>
> + .. _PKZIP Application Note:
> https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpkwa=
re.cachefly.net%2Fwebdocs%2Fcasestudies%2FAPPNOTE.TXT&data=3D04%7C01%7CRahu=
l.Taya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637503788090909491%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Dr%=
2FAlrrXc2JKLe%2Bj0WIXXq6NlwAjpkxpy5h6sYO3v%2FCg%3D&reserved=3D0>
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

--000000000000dead9305bca3d601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 3, 2021 at 4:26 PM Rahul Taya=
 &lt;<a href=3D"mailto:Rahul.Taya@kpit.com">Rahul.Taya@kpit.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">



<div>
<div>
<div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
Hi Martin,</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
<br>
</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
No i run devtool modify python only once and it applies the patch in source=
 file.</div></div></div></div></blockquote><div><br></div><div>Then you had=
 to run &quot;git am&quot; manually in this directory and never finish? you=
 need to finish it or all git am --abort when you give up.<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
What i=E2=80=99 m not getting is how i generate a patch after this.</div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
=C2=A0By taking git diff b/w the original source file and the patched file =
or what?</div></div></div></div></blockquote><div><br></div><div>either &qu=
ot;git format-patch&quot; when you have applied the patch manually or &quot=
;devtool finish --force-patch-refresh ...&quot; will call &quot;git format-=
patch&quot; for you when devtool was able to apply the patch with just a fu=
zz.</div><div><br></div><div>Anyway you&#39;re still expected to review the=
 changes in regenerated patch to confirm that it still does what it was sup=
posed to do.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><div><div>
<div dir=3D"ltr" style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255=
)">
Yes martin you applied my patch in master-next which is also required for d=
unfell.As i have other patches too i.e CVE-2019-20907 for python that i hav=
e<span style=3D"font-size:inherit">=C2=A0sent and nghttp2 patch that=E2=80=
=99s why i thought to fix their warnings also
 using devtool and then send to you for applying.</span></div></div></div><=
/div></blockquote><div><br></div><div>I&#39;ve already applied CVE-2019-209=
07 as well and fixed the patch-fuzz there, will push it to master-next as w=
ell. I&#39;ll push it to gatesgarth-next and dunfell-next as well.</div><di=
v><br></div><div>And for nghttp2 patch I&#39;ve sent the fix as well, see:<=
/div><div><a href=3D"https://git.openembedded.org/meta-openembedded-contrib=
/commit/?h=3Djansa/dunfell&amp;id=3D3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce=
0">https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa=
/dunfell&amp;id=3D3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0</a><br></div><di=
v>which I&#39;ve sent when your version of the patch was in dunfell-next, s=
ee:</div><div><a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/message/89628">https://lists.openembedded.org/g/openembedded-devel/messag=
e/89628</a>=C2=A0</div><br>+oe-devel ML</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div><div id=3D"gmail-m_212127092=
7748278918divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" sty=
le=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Martin Jansa &lt;<a hr=
ef=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.c=
om</a>&gt;<br>
<b>Sent:</b> Wednesday, March 3, 2021 8:03:12 PM<br>
<b>To:</b> Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" target=3D"=
_blank">Rahul.Taya@kpit.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for=
 CVE-2019-9674</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">Did you run &quot;devtool modify python&quot; twice? If th=
e first call failed to apply patches you need to go into=C2=A0workspace/sou=
rces/python and finish applying it manually.
<div><br>
</div>
<div>But as said in previous e-mails I&#39;ve already updated your python p=
atch to apply cleanly (and it&#39;s in meta-python2/master-next), so I&#39;=
m not sure what you&#39;re trying to do now.</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Wed, Mar 3, 2021 at 2:51 PM Rahul Taya &lt;<a href=3D"m=
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
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978Signature=
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
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978appendons=
end"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978divRplyFw=
dMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" color=3D"#000000" styl=
e=3D"font-size:11pt"><b>From:</b>
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:ope=
nembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-deve=
l@lists.openembedded.org</a>&gt; on behalf of
 Martin Jansa via <a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttp%3A%2F%2Flists.openembedded.org%2F&amp;data=3D04%7C01%7CRahul.T=
aya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C637503788090869534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJ=
Cevxk14rWrYeYG6NMjCKbEc%2FGV%2FAPjF%2FsyKHGa0vcw%3D&amp;reserved=3D0" targe=
t=3D"_blank">
lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</=
a>&gt;<br>
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
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786Signature">
<div>
<div></div>
<div name=3D"x_x_divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786divRplyFwdMsg" dir=3D"ltr">
<font face=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11p=
t"><b>From:</b> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
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
ttps%3A%2F%2Faka.ms%2Fo0ukef&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9=
193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637503788090879514%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8qwZgjGzXSFBpHQtW9N=
Xg8Z2ndlebOn7CGMbUvCco9Y%3D&amp;reserved=3D0" target=3D"_blank">
Outlook for iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786x_gmail-m_8535883728496035522divRplyFwdMsg" dir=3D"ltr"=
>
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
2FCVE-2019-9674.patch&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43c=
bc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63750=
3788090879514%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DeWAfxq3RnC58UC2fOdvLq%2BZ%=
2BdEqMY2jC4UC7QLVd7ow%3D&amp;reserved=3D0" id=3D"gmail-m_212127092774827891=
8x_gmail-m_603417159103648978x_gmail-m_1797946359111992786x_gmail-m_8535883=
728496035522x_gmail-m_-2317439710916735757LPlnk" target=3D"_blank">https://=
github.com/Rahult9/upstream_patch/blob/main/CVE-2019-9674.patch</a></span><=
/span><br>
</div>
<div></div>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786x_gmail-m_8535883728496035522x_gmail-m_-231743971091673=
5757Signature">
<div>
<div></div>
<div name=3D"x_x_x_x_divtagdefaultwrapper">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786x_gmail-m_8535883728496035522x_gmail-m_-231743971091673=
5757appendonsend">
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_2121270927748278918x_gmail-m_603417159103648978x_gmail-m=
_1797946359111992786x_gmail-m_8535883728496035522x_gmail-m_-231743971091673=
5757divRplyFwdMsg" dir=3D"ltr">
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
7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637503788090889508%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Da78O00g99NZRFABW=
XJxxEnYi0XNXth%2Bz%2FKSkSQHXWWg%3D&amp;reserved=3D0" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</=
a>
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
7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637503788090889508%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3D8WNO3k087HhZTbusKgNIz90vEXsLPFvvWYPAhBOZia0%3D&amp;reserved=3D=
0" rel=3D"noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/po=
ol/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz</a>]<br=
>
+CVE: CVE-2019-9674<br>
+Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
p:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3=
.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&amp;data=3D04%7C01%7CRahul.Taya%40=
kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637503788090899497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DKVUivnP=
gsPMCcdqJYV2Zz4Xv1jdVaPvVoFNQtFl7RoQ%3D&amp;reserved=3D0" rel=3D"noreferrer=
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
CRahul.Taya%40kpit.com%7C9193c43cbc274d86d5dc08d8de514df0%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637503788090909491%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DyjgmXUObjQ3krrxYAcJ3351kmYUXBrDqWalvmaY4wxY%3D&amp;reserved=3D0" rel=
=3D"noreferrer" target=3D"_blank">
https://en.wikipedia.org/wiki/Zip_bomb</a><br>
+ .. _PKZIP Application Note: <a href=3D"https://apc01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fpkware.cachefly.net%2Fwebdocs%2Fcasestudi=
es%2FAPPNOTE.TXT&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C9193c43cbc274=
d86d5dc08d8de514df0%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375037880=
90909491%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dr%2FAlrrXc2JKLe%2Bj0WIXXq6NlwAj=
pkxpy5h6sYO3v%2FCg%3D&amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank=
">
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

</blockquote></div></div>

--000000000000dead9305bca3d601--
