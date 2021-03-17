Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.2412.1615956198434381085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 21:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uk2ANZKt;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o10so24059318pgg.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 21:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dKcoY5UzAYOjHFg8N0I99tTjsQxxbPiaoMBeib0Ze00=;
        b=Uk2ANZKtBJWcq1he+HObcC5+AQMQSFcjpbkDJ/Kuhxe4dgikTDXk8EnNaaCnSFwwom
         RptRYWAftQap4a1bCAXEuOGVLeAZfUkOtiAFX1YJEEkZ6ztcDk40ndY57BXL5KsgzL8t
         EMMXlfV6VeeH9HNPTSdam16HD2kZNds7qg/ZLzSFBGH+9E9/Y4WAbe7R6F0Gga43WRJn
         Mn5PXWD/YtAwzUSDUn9pRYGlDWV03iDPIVPOVuWrE1dEDKGyXlxVq97IIou0nO9ym8n2
         tUTnn0NGIktR44r4u7sC0VZ1I8WRc449QUUp6RscnqogbX7IAhtb/8D77Q3pdOGqjatu
         ffuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dKcoY5UzAYOjHFg8N0I99tTjsQxxbPiaoMBeib0Ze00=;
        b=NSln3jjVWYwVk+sln/0vkqWLgixMVgsiLriKV1uddZj7O2QoyFcYAVNxmOhnclEsHX
         muyu0Yh0fiHSxFLUwex54dTkR+USYnuO2OiR6sCP6n8W3j/dxYIL51+N8KA26aS2JLrt
         K8LuVad07Ek9+lwZRNWiWA7sXKZ+HZ2lo/CAyNlJrStQmTFumCZM1CgK3ZHorwl0Mnuc
         jVZq1xOvUKzaAiGuNgHS41PNmAUT3H2XXUMu2Y/QATv60f+jy7DD4ALZiD/isESinF5p
         YcOhSxi5f3EXA+n1yM3R0dCH/vvfPxjbvsHCf5jAV51h9ioxC3utvauT8FgGqSmUg98u
         4ZkQ==
X-Gm-Message-State: AOAM5327PSB5LUhNvbJ2NbRE2IQMoG5Hfg/Cq7GA1OLZfK0Er0Q+szb6
	EMnmeHjZW3Ah78TWGNio36R88roM/UA=
X-Google-Smtp-Source: ABdhPJzGbjMequMJxjCWcZ56qbeYyPwS/9hB8os6q68TIf737dJOsZm3/XL0G9F4mxKZ5/oEgwNhlg==
X-Received: by 2002:a63:904b:: with SMTP id a72mr1020816pge.77.1615956197214;
        Tue, 16 Mar 2021 21:43:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:25c8:44cd:2453:cf2a? ([2601:202:4180:a5c0:25c8:44cd:2453:cf2a])
        by smtp.gmail.com with ESMTPSA id f11sm11598788pga.34.2021.03.16.21.43.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 21:43:16 -0700 (PDT)
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: openembedded-devel@lists.openembedded.org
References: <20210216152349.30824-1-Rahul.Taya@kpit.com>
 <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
 <BMXPR01MB34313989023828E45EBFAE7BF29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQeuX0JXcWq1WhQEX9mkS67_-ZSpMhsJ-m0ow7JJ3boTgA@mail.gmail.com>
 <BMXPR01MB34313781E1537C2248D69382F29E9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQe-654P3L1O0D35LsyTiFFgYxt3+o7-d23_x2pzfrUj2w@mail.gmail.com>
 <BMXPR01MB3431C351DFE5682CB4AD905DF29A9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQd1jLHuVEaVxsR=aQ2Pv_qtkGHR3_jpGhJGQdtT8Ujx-w@mail.gmail.com>
 <BMXPR01MB34318ECB49D8B955CE4CE282F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQfnuA9pUagKVLNZ4Z+O63kpTAPJW_B0eWsjnL6oXgCbHA@mail.gmail.com>
 <BMXPR01MB3431C751D5DCF36F6DC7B1C1F2989@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <CA+chaQcFZCPLySJTy4pAnSDNOk2rRr77RPJ5TmaWWyfN6QWP4g@mail.gmail.com>
 <BMXPR01MB343109DC6BB600FFBE03D7D1F26B9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <5d49d2f5-6eae-98ec-2f13-67c8e740f89d@gmail.com>
Date: Tue, 16 Mar 2021 21:43:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB343109DC6BB600FFBE03D7D1F26B9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US





On 3/16/21 12:25 AM, Rahul Taya wrote:
> Hi Martin,
>
> Is there any update for nghttp2 CVE-2020-11080  fix that you have sent
> earlier ?
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/dunfell&id=3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openembedded.org%2Fmeta-openembedded-contrib%2Fcommit%2F%3Fh%3Djansa%2Fdunfell%26id%3D3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614843758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=qNySlF2ouK6IiAvo2J68imnOZRB66RjwjCGhTYCoAnw%3D&reserved=0>
>
> I think it's still not merged.

I took the v2 and its in dunfell-next.
-armin
>
> Thanks and Regards,
> Rahul Taya
> ------------------------------------------------------------------------
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Wednesday, March 3, 2021 9:22 PM
> *To:* Rahul Taya <Rahul.Taya@kpit.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>;
> Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>; Nisha Parrakat
> <Nisha.Parrakat@kpit.com>
> *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
> CVE-2019-9674
>  
> On Wed, Mar 3, 2021 at 4:26 PM Rahul Taya <Rahul.Taya@kpit.com
> <mailto:Rahul.Taya@kpit.com>> wrote:
>
>     Hi Martin,
>
>     No i run devtool modify python only once and it applies the patch
>     in source file.
>
>
> Then you had to run "git am" manually in this directory and never
> finish? you need to finish it or all git am --abort when you give up.
>
>     What i’ m not getting is how i generate a patch after this.
>      By taking git diff b/w the original source file and the patched
>     file or what?
>
>
> either "git format-patch" when you have applied the patch manually or
> "devtool finish --force-patch-refresh ..." will call "git
> format-patch" for you when devtool was able to apply the patch with
> just a fuzz.
>
> Anyway you're still expected to review the changes in regenerated
> patch to confirm that it still does what it was supposed to do.
>
>     Yes martin you applied my patch in master-next which is also
>     required for dunfell.As i have other patches too i.e
>     CVE-2019-20907 for python that i have sent and nghttp2 patch
>     that’s why i thought to fix their warnings also using devtool and
>     then send to you for applying.
>
>
> I've already applied CVE-2019-20907 as well and fixed the patch-fuzz
> there, will push it to master-next as well. I'll push it to
> gatesgarth-next and dunfell-next as well.
>
> And for nghttp2 patch I've sent the fix as well, see:
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/dunfell&id=3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openembedded.org%2Fmeta-openembedded-contrib%2Fcommit%2F%3Fh%3Djansa%2Fdunfell%26id%3D3a3a6c4e42d0b1c22d4e0d9cfd42d3e119972ce0&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614843758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=qNySlF2ouK6IiAvo2J68imnOZRB66RjwjCGhTYCoAnw%3D&reserved=0>
> which I've sent when your version of the patch was in dunfell-next, see:
> https://lists.openembedded.org/g/openembedded-devel/message/89628
> <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F89628&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614843758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=dUbJ%2BoCGl7NtsJPluCH7LXWPAvlNWajSyDjZeXC3gjA%3D&reserved=0> 
>
> +oe-devel ML
>
>     *From:* Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     *Sent:* Wednesday, March 3, 2021 8:03:12 PM
>     *To:* Rahul Taya <Rahul.Taya@kpit.com <mailto:Rahul.Taya@kpit.com>>
>     *Cc:* openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>>
>     *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix
>     for CVE-2019-9674
>      
>     Did you run "devtool modify python" twice? If the first call
>     failed to apply patches you need to go
>     into workspace/sources/python and finish applying it manually.
>
>     But as said in previous e-mails I've already updated your python
>     patch to apply cleanly (and it's in meta-python2/master-next), so
>     I'm not sure what you're trying to do now.
>
>     On Wed, Mar 3, 2021 at 2:51 PM Rahul Taya <Rahul.Taya@kpit.com
>     <mailto:Rahul.Taya@kpit.com>> wrote:
>
>         Hi Martin,
>
>         Firstlty i run : *devtool modify python*
>
>         this command applied all the patches in the source code.
>         After this when i run :
>
>                  devtool finish --force-patch-refresh <recipe> <layer_path>
>
>         where recipe = python and layer path = /workspace/sources/python
>
>         i'm getting message:  *workspace/sources/python appears to be
>         in the middle of 'git am' or 'git apply' - please resolve this
>         first*
>         *
>         *
>         Can you please help why i'm getting this and how to resolve it ?
>
>         Thanks and Regards,
>         Rahul Taya
>         ------------------------------------------------------------------------
>         *From:* openembedded-devel@lists.openembedded.org
>         <mailto:openembedded-devel@lists.openembedded.org>
>         <openembedded-devel@lists.openembedded.org
>         <mailto:openembedded-devel@lists.openembedded.org>> on behalf
>         of Martin Jansa via lists.openembedded.org
>         <https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.openembedded.org%2F&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614853753%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=fvYJtvQvNCvjys3z0icl%2Bg5BNhax0egcZWkemoHy1To%3D&reserved=0>
>         <Martin.Jansa=gmail.com@lists.openembedded.org
>         <mailto:gmail.com@lists.openembedded.org>>
>         *Sent:* Monday, March 1, 2021 8:16 PM
>         *To:* Rahul Taya <Rahul.Taya@kpit.com
>         <mailto:Rahul.Taya@kpit.com>>
>         *Cc:* openembedded-devel
>         <openembedded-devel@lists.openembedded.org
>         <mailto:openembedded-devel@lists.openembedded.org>>
>         *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python: Add
>         fix for CVE-2019-9674
>          
>         > Can you please tell me what i should do if a fuzz is
>         detected while applying patch or i see some warning message ?
>
>         The QA warning/error message about patch-fuzz shows you how to
>         easily resolve the fuzz with devtool.
>
>         If it doesn't apply at all (like that nghttp2 patch), then you
>         need to apply it manually by resolving all conflicts and then
>         refresh the patch file (I usually create a git repo in ${S} if
>         it isn't there already from SRC_URI, then manually apply the
>         failing patch and then git format-patch it).
>
>         On Mon, Mar 1, 2021 at 3:26 PM Rahul Taya <Rahul.Taya@kpit.com
>         <mailto:Rahul.Taya@kpit.com>> wrote:
>
>             Hi Martin,
>
>             Yes i think you are right it can be possible that i
>             overlooked or missed the warning.
>
>             Can you please tell me what i should do if a fuzz is
>             detected while applying patch or i see some warning message ?
>
>
>             For nghttp patch please check attached screenshot this is
>             the last message that i saw.
>             Can you tell me what next to do for that patch ?
>
>             Thanks and Regards,
>             Rahul Taya
>             ------------------------------------------------------------------------
>             *From:* Martin Jansa <martin.jansa@gmail.com
>             <mailto:martin.jansa@gmail.com>>
>             *Sent:* Thursday, February 25, 2021 10:33 PM
>             *To:* Rahul Taya <Rahul.Taya@kpit.com
>             <mailto:Rahul.Taya@kpit.com>>
>             *Cc:* openembedded-devel
>             <openembedded-devel@lists.openembedded.org
>             <mailto:openembedded-devel@lists.openembedded.org>>
>             *Subject:* Re: [oe] [meta-python2][dunfell][PATCH] python:
>             Add fix for CVE-2019-9674
>              
>             Hi Rahul,
>
>             you probably don't have patch-fuzz in ERROR_QA and
>             overlooked the warning generated by this QA check which is
>             by default only in WARN_QA.
>
>             Or you weren't testing it with master branch as the
>             subject says it's for dunfell, but it the python version
>             is the same in master and dunfell, so the warning should
>             be triggered in both.
>
>             On Thu, Feb 25, 2021 at 5:19 PM Rahul Taya
>             <Rahul.Taya@kpit.com <mailto:Rahul.Taya@kpit.com>> wrote:
>
>                 Hi Martin,
>
>                 I have tested my changes before sending to you or ML i
>                 don’t know why it is failing now at your side.
>
>                 Thanks and Regards,
>                 Rahul
>
>                 Get Outlook for iOS
>                 <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Faka.ms%2Fo0ukef&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614853753%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=923piAM9LEXp054cWFKRMfu3HGdFb9RX5UVcchwZJWk%3D&reserved=0>
>                 ------------------------------------------------------------------------
>                 *From:* Martin Jansa <martin.jansa@gmail.com
>                 <mailto:martin.jansa@gmail.com>>
>                 *Sent:* Thursday, February 25, 2021 8:25:50 PM
>                 *To:* Rahul Taya <Rahul.Taya@kpit.com
>                 <mailto:Rahul.Taya@kpit.com>>
>                 *Cc:* openembedded-devel
>                 <openembedded-devel@lists.openembedded.org
>                 <mailto:openembedded-devel@lists.openembedded.org>>
>                 *Subject:* Re: [oe] [meta-python2][dunfell][PATCH]
>                 python: Add fix for CVE-2019-9674
>                  
>                 Hi,
>
>                 normally you should fork meta-python2 and send a link
>                 to meta-python2 change I can cherry-pick, not the blob
>                 in otherwise empty repo.
>
>                 But as I've said in previous reply, I've already
>                 manually applied your change in meta-python2
>                 master-next where it's now failing:
>
>                 ERROR: python-native-2.7.18-r0 do_patch: Fuzz detected:
>
>                 Applying patch CVE-2019-9674.patch
>                 patching file Doc/library/zipfile.rst
>                 Hunk #1 succeeded at 554 with fuzz 2 (offset -20 lines).
>
>
>                 The context lines in the patches can be updated with devtool:
>
>                     devtool modify python-native
>                     devtool finish --force-patch-refresh python-native <layer_path>
>
>                 Don't forget to review changes done by devtool!
>
>                 ERROR: python-native-2.7.18-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]
>
>                 so I'll fix this as well, but next time please better test your changes (nghttp2 patch also didn't apply, see my reply there, not sure if you have fixed that in v2)
>
>                 Regards,
>
>
>
>
>                 On Thu, Feb 25, 2021 at 9:09 AM Rahul Taya
>                 <Rahul.Taya@kpit.com <mailto:Rahul.Taya@kpit.com>> wrote:
>
>                     Hi Martin,
>
>                     I removed the emoticons and uploaded the patch to
>                     my git repo pls access below link:
>
>                     https://github.com/Rahult9/upstream_patch/blob/main/CVE-2019-9674.patch
>                     <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FRahult9%2Fupstream_patch%2Fblob%2Fmain%2FCVE-2019-9674.patch&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614863746%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=CC%2BRWYUzuXwF6IuPmgo%2BBNYSam6ki%2BKf3opXGs4jpBw%3D&reserved=0>
>
>
>                     Thanks and Regards,
>                     Rahul Taya
>                     ------------------------------------------------------------------------
>                     *From:* Martin Jansa <martin.jansa@gmail.com
>                     <mailto:martin.jansa@gmail.com>>
>                     *Sent:* Thursday, February 18, 2021 10:58 PM
>                     *To:* Rahul Taya <Rahul.Taya@kpit.com
>                     <mailto:Rahul.Taya@kpit.com>>
>                     *Cc:* openembedded-devel
>                     <openembedded-devel@lists.openembedded.org
>                     <mailto:openembedded-devel@lists.openembedded.org>>;
>                     Khem Raj <raj.khem@gmail.com
>                     <mailto:raj.khem@gmail.com>>; Nisha Parrakat
>                     <Nisha.Parrakat@kpit.com
>                     <mailto:Nisha.Parrakat@kpit.com>>; Harpritkaur
>                     Bhandari <Harpritkaur.Bhandari@kpit.com
>                     <mailto:Harpritkaur.Bhandari@kpit.com>>
>                     *Subject:* Re: [oe] [meta-python2][dunfell][PATCH]
>                     python: Add fix for CVE-2019-9674
>                      
>                     "git am" doesn't like those emoticons in the
>                     .patch file..
>
>                     git am ~/py2/cur/16136689*
>                     error: cannot convert from 8bit to UTF-8
>                     fatal: could not parse patch
>
>                     either drop them or upload it to some git repo so
>                     I can cherry-pick it from there.
>
>                     On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya
>                     <Rahul.Taya@kpit.com <mailto:Rahul.Taya@kpit.com>>
>                     wrote:
>
>                         For python and python-native added patch to fix
>                         CVE-2019-9674
>
>                         Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com
>                         <mailto:Rahul.Taya@kpit.com>>
>                         ---
>                          recipes-devtools/python/python.inc           
>                         |  1 +
>                          .../python/python/CVE-2019-9674.patch       
>                          | 83 +++++++++++++++++++
>                          2 files changed, 84 insertions(+)
>                          create mode 100644
>                         recipes-devtools/python/python/CVE-2019-9674.patch
>
>                         diff --git
>                         a/recipes-devtools/python/python.inc
>                         b/recipes-devtools/python/python.inc
>                         index a4ba0c5..787f23e 100644
>                         --- a/recipes-devtools/python/python.inc
>                         +++ b/recipes-devtools/python/python.inc
>                         @@ -8,6 +8,7 @@ INC_PR = "r1"
>                          LIC_FILES_CHKSUM =
>                         "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
>
>                          SRC_URI =
>                         "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
>                         <https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.python.org%2Fftp%2Fpython%2F%24%257BPV%257D%2FPython-%24%257BPV%257D.tar.xz&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614873740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=fZ5XDPu0Tyw92t%2FlJ1ilsBn76Fi4BUGsHy5upFtw20c%3D&reserved=0>
>                         \
>                         +           file://CVE-2019-9674.patch \
>                                     "
>
>                          SRC_URI[sha256sum] =
>                         "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
>                         diff --git
>                         a/recipes-devtools/python/python/CVE-2019-9674.patch
>                         b/recipes-devtools/python/python/CVE-2019-9674.patch
>                         new file mode 100644
>                         index 0000000..647d9da
>                         --- /dev/null
>                         +++
>                         b/recipes-devtools/python/python/CVE-2019-9674.patch
>                         @@ -0,0 +1,83 @@
>                         +From 3ba51d587f6897a45301ce9126300c14fcd4eba2
>                         Mon Sep 17 00:00:00 2001
>                         +From: JunWei Song <sungboss2004@gmail.com
>                         <mailto:sungboss2004@gmail.com>>
>                         +Date: Wed, 11 Sep 2019 23:04:12 +0800
>                         +Subject: [PATCH] bpo-36260: Add pitfalls to
>                         zipfile module documentation
>                         + (#13378)
>                         +MIME-Version: 1.0
>                         +Content-Type: text/plain; charset=UTF-8
>                         +Content-Transfer-Encoding: 8bit
>                         +
>                         +* bpo-36260: Add pitfalls to zipfile module
>                         documentation
>                         +
>                         +We saw vulnerability warning description
>                         (including zip bomb) in Doc/library/xml.rst file.
>                         +This gave us the idea of documentation
>                         improvement.
>                         +
>                         +So, we moved a little bit forward :P
>                         +And the doc patch can be found (pr).
>                         +
>                         +* fix trailing whitespace
>                         +
>                         +* 📜🤖 Added by blurb_it.
>                         +
>                         +* Reformat text for consistency.
>                         +
>                         +Upstream-Status:
>                         Backport[http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz
>                         <https://apc01.safelinks.protection.outlook.com/?url=http:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614873740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=TMC75PnOu04fyODBF8KdtXjUhmR0YfU4ncWRWTRiLQg%3D&reserved=0>]
>                         +CVE: CVE-2019-9674
>                         +Link:
>                         http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz
>                         <https://apc01.safelinks.protection.outlook.com/?url=http:%2F%2Farchive.ubuntu.com%2Fubuntu%2Fpool%2Fmain%2Fp%2Fpython3.5%2Fpython3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614883733%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=anqhyt5ynucB%2FlVaUnLA6RWrl0GKlz3u34kqk4ZUlXE%3D&reserved=0>
>                         +Comment: From the original patch skipped
>                         changes for file
>                         +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
>                         +as this file is not present in our source code.
>                         +---
>                         + Doc/library/zipfile.rst                     
>                          | 41 +++++++++++++++++++
>                         + 1 files changed, 41 insertions(+)
>                         +
>                         +diff --git a/Doc/library/zipfile.rst
>                         b/Doc/library/zipfile.rst
>                         +index b421ea5..2e0a91d 100644
>                         +--- a/Doc/library/zipfile.rst
>                         ++++ b/Doc/library/zipfile.rst
>                         +@@ -574,4 +574,45 @@ Instances have the
>                         following attributes:
>                         +
>                         +    Size of the uncompressed file.
>                         +
>                         ++Decompression pitfalls
>                         ++----------------------
>                         ++
>                         ++The extraction in zipfile module might fail
>                         due to some pitfalls listed below.
>                         ++
>                         ++From file itself
>                         ++~~~~~~~~~~~~~~~~
>                         ++
>                         ++Decompression may fail due to incorrect
>                         password / CRC checksum / ZIP format or
>                         ++unsupported compression method / decryption.
>                         ++
>                         ++File System limitations
>                         ++~~~~~~~~~~~~~~~~~~~~~~~
>                         ++
>                         ++Exceeding limitations on different file
>                         systems can cause decompression failed.
>                         ++Such as allowable characters in the
>                         directory entries, length of the file name,
>                         ++length of the pathname, size of a single
>                         file, and number of files, etc.
>                         ++
>                         ++Resources limitations
>                         ++~~~~~~~~~~~~~~~~~~~~~
>                         ++
>                         ++The lack of memory or disk volume would lead
>                         to decompression
>                         ++failed. For example, decompression bombs
>                         (aka `ZIP bomb`_)
>                         ++apply to zipfile library that can cause disk
>                         volume exhaustion.
>                         ++
>                         ++Interruption
>                         ++~~~~~~~~~~~~
>                         ++
>                         ++Interruption during the decompression, such
>                         as pressing control-C or killing the
>                         ++decompression process may result in
>                         incomplete decompression of the archive.
>                         ++
>                         ++Default behaviors of extraction
>                         ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                         ++
>                         ++Not knowing the default extraction behaviors
>                         ++can cause unexpected decompression results.
>                         ++For example, when extracting the same
>                         archive twice,
>                         ++it overwrites files without asking.
>                         ++
>                         ++
>                         ++.. _ZIP bomb:
>                         https://en.wikipedia.org/wiki/Zip_bomb
>                         <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FZip_bomb&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614893728%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=47O05DRkPnU6CjbSKXWLQuM%2BO4%2B2Q%2FwKFrdzmpqB%2FF0%3D&reserved=0>
>                         + .. _PKZIP Application Note:
>                         https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
>                         <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpkware.cachefly.net%2Fwebdocs%2Fcasestudies%2FAPPNOTE.TXT&data=04%7C01%7CRahul.Taya%40kpit.com%7C10953aac03c94ff4821808d8de5c5d97%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637503835614893728%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=E9aClMux7AXNYYe36EdbrksrvWp57TbGEpeo%2BJefZBM%3D&reserved=0>
>                         --
>                         2.17.1
>
>                         This message contains information that may be
>                         privileged or confidential and is the property
>                         of the KPIT Technologies Ltd. It is intended
>                         only for the person to whom it is addressed.
>                         If you are not the intended recipient, you are
>                         not authorized to read, print, retain copy,
>                         disseminate, distribute, or use this message
>                         or any part thereof. If you receive this
>                         message in error, please notify the sender
>                         immediately and delete all copies of this
>                         message. KPIT Technologies Ltd. does not
>                         accept any liability for virus infected mails.
>
>
>
>                     This message contains information that may be
>                     privileged or confidential and is the property of
>                     the KPIT Technologies Ltd. It is intended only for
>                     the person to whom it is addressed. If you are not
>                     the intended recipient, you are not authorized to
>                     read, print, retain copy, disseminate, distribute,
>                     or use this message or any part thereof. If you
>                     receive this message in error, please notify the
>                     sender immediately and delete all copies of this
>                     message. KPIT Technologies Ltd. does not accept
>                     any liability for virus infected mails.
>
>                 This message contains information that may be
>                 privileged or confidential and is the property of the
>                 KPIT Technologies Ltd. It is intended only for the
>                 person to whom it is addressed. If you are not the
>                 intended recipient, you are not authorized to read,
>                 print, retain copy, disseminate, distribute, or use
>                 this message or any part thereof. If you receive this
>                 message in error, please notify the sender immediately
>                 and delete all copies of this message. KPIT
>                 Technologies Ltd. does not accept any liability for
>                 virus infected mails.
>
>             This message contains information that may be privileged
>             or confidential and is the property of the KPIT
>             Technologies Ltd. It is intended only for the person to
>             whom it is addressed. If you are not the intended
>             recipient, you are not authorized to read, print, retain
>             copy, disseminate, distribute, or use this message or any
>             part thereof. If you receive this message in error, please
>             notify the sender immediately and delete all copies of
>             this message. KPIT Technologies Ltd. does not accept any
>             liability for virus infected mails.
>
>         This message contains information that may be privileged or
>         confidential and is the property of the KPIT Technologies Ltd.
>         It is intended only for the person to whom it is addressed. If
>         you are not the intended recipient, you are not authorized to
>         read, print, retain copy, disseminate, distribute, or use this
>         message or any part thereof. If you receive this message in
>         error, please notify the sender immediately and delete all
>         copies of this message. KPIT Technologies Ltd. does not accept
>         any liability for virus infected mails.
>
>     This message contains information that may be privileged or
>     confidential and is the property of the KPIT Technologies Ltd. It
>     is intended only for the person to whom it is addressed. If you
>     are not the intended recipient, you are not authorized to read,
>     print, retain copy, disseminate, distribute, or use this message
>     or any part thereof. If you receive this message in error, please
>     notify the sender immediately and delete all copies of this
>     message. KPIT Technologies Ltd. does not accept any liability for
>     virus infected mails.
>
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected mails.
>
> 
>

