Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22642CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 17:35:12 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.57237.1755452109591553592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 10:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvKuTITf;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so502638766b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755452108; x=1756056908; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCCGYO6cJ5FlviHNhfT3+iM2kPAFVsJ9rZy6ne51nKo=;
        b=KvKuTITfU1YwgXg5spNBqSf/woOSgHTUjv1fxMSVALVaWVo6cZXiCNdVkDQg/V7+z2
         yeUQUoaKZrQcf1w2OROvbP/4biueqXEC36xWD0t+QgYPnlNJFiv3W7+/X0Sv1yiP9YW8
         ObFUogH4oJaul1PQ8Y7UWruN03p9F3t6I++d9C2ne66Rxmn2Lu/9+fz9S4/vB48CwXhY
         lf+3lLtCjNIBQGF6vVSFxgjTKVOnftrYlK5XLag4YzOqitnOarEJrreyz/wGjuAOras8
         CnicahaspNcn8oWOyuys4J66Fr40D3YfhPgyHa3VIPXInCKw6lz/AhJc9L4V+nE65vCg
         bOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755452108; x=1756056908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCCGYO6cJ5FlviHNhfT3+iM2kPAFVsJ9rZy6ne51nKo=;
        b=dIdYULDgLG0WZ3eJlUe4ZArF4DvxbmT+WmmrQVlzmIj/VsJwal8rf0qcB03l6EH4YC
         ui7vcoDGGe/Jk5JIXK5LYr7H6NgvbG0IGQYK21zBLCFcB1GUTIqUHcXr7w7pmDKrwt+b
         NPV7bH8il8UApbdOjkBuqE34yFD41G1C0AYzKy9ptEwwhnBsG0XCrj0z/8prkkVQQ+lp
         BO+cvcWdHneLOCj9Yvvslxg/iDESTXDVUDkgmTtIrRMveyUZDyCufk3sYPGNDrdP57Py
         +XUPBzZUuH3D7k8fuvESvCfAGJ/oYKJeHWdUU3Qc/fNtr6WfM0X0xWYTRbffJhT7EeHl
         JeaA==
X-Gm-Message-State: AOJu0YyK7L9XEVmwM7SnQUrnGYLW4V9GhymMj55RFxmhpRTNHV9wxfnK
	/da0IvaPcWvkF2kVPg338oG44SS6bwpPZk+T5tO6Xqge6GECX7oBSLdSsGckrw==
X-Gm-Gg: ASbGncswDs3R3kvz0D/3aBdoSnqa5M7nGLeS0brzekl++Iivq41h6HMQuGqUxV8rJH/
	6q+TaZjwxqeMLTRMJ+JrlnW3eq3F3vg+/B4F9pGMAc9zn+2zIrPvhreu4MPmPk3vDjOXxo7CrxK
	dRwZuijlVKOQ12FAz0gs1KECJSh2Kc2P7q/fH6K94Y+Nvofyg4SzjOO9ic0UJyBCPu8Nd/FOH0e
	XeawUybPsiFA3XH/FoMZDY60yzJi2+DW59ngJa9oRoNzwzfZPr5MdYJdJRAm11OT8Mk+9Ta/6bQ
	DmgtsdylK2vuoI0It2XnUY2U1ekLnt4zBLheyQcig+xb7350uQ0P5X+JmjgSbEox0fQASVKfxpW
	JWSjCcGuwUrHfBjQ7O4DPaCRekIFX6Tif1ZXv3xMI/1FZbvK/fgzm
X-Google-Smtp-Source: AGHT+IGwFlTdPiY5G0v4rP9epMO5mqOmaejvIdjidaGpKmW4qff3WgxiC4MZ/iB/6JV/Qr2pWjro7w==
X-Received: by 2002:a17:907:2d06:b0:af9:2002:c18a with SMTP id a640c23a62f3a-afcdc082152mr938720366b.16.1755452107599;
        Sun, 17 Aug 2025 10:35:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53c26sm626161266b.17.2025.08.17.10.35.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 10:35:07 -0700 (PDT)
Message-ID: <e7f38aaa-b4bc-4aa9-a5a7-3ea30994bb8a@gmail.com>
Date: Sun, 17 Aug 2025 19:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gitpkgv.bbclass: inspect repository in
 UNPACKDIR
To: openembedded-devel@lists.openembedded.org
References: <185C8340ADC0E6D9.8958@lists.openembedded.org>
 <185C83615B3CBF8D.30607@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <185C83615B3CBF8D.30607@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 17:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118983

On 8/17/25 11:20, Gyorgy Sarvari via lists.openembedded.org wrote:
> In my testing it looks okay, but if someone else could test/review it
> also to see if it makes sense, it would be useful.

A short off-list exchange with WXbet made me look a bit more, and there
is a gotcha.

Looking at older releases, BB_GIT_SHALLOW used to have effect on mirror
tarball fetching and generation only, not on fetching from git.

But now there is actual shallow cloning, which changes the behavior of
this class beyond the folder issue: it's not possible to determine the
real number of commits, so the versions generated by this class won't be
very sortable.

Should there be maybe a bb.warn/fatal error if shallow clone is enabled?
Or just a comment in the class? Or just drop this change, and keep it as
it is?

Does anyone have any preference/suggestion?

>
> On 8/17/25 11:17, Gyorgy Sarvari via lists.openembedded.org wrote:
>> When BB_GIT_SHALLOW = "1" is used, the unpacked gir repository doesn't
>> exist in the download folder, and the class isn't able to instect the
>> details of the repository.
>>
>> Instead inspect the repository it the UNPACKDIR.
>>
>> Reported-by: WXbet <WXbet@proton.me>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-oe/classes/gitpkgv.bbclass | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
>> index eb4b1eae9a..1afe9c53d8 100644
>> --- a/meta-oe/classes/gitpkgv.bbclass
>> +++ b/meta-oe/classes/gitpkgv.bbclass
>> @@ -59,6 +59,9 @@ def get_git_pkgv(d, use_tags):
>>      from shlex import quote
>>  
>>      src_uri = d.getVar('SRC_URI').split()
>> +    unpackdir = d.getVar('UNPACKDIR')
>> +    def_destsuffix = (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git") + "/"
>> +
>>      fetcher = bb.fetch2.Fetch(src_uri, d)
>>      ud = fetcher.ud
>>  
>> @@ -78,20 +81,24 @@ def get_git_pkgv(d, use_tags):
>>      found = False
>>      for url in ud.values():
>>          if url.type == 'git' or url.type == 'gitsm':
>> -            if not os.path.exists(url.localpath):
>> +            destsuffix = url.parm.get("destsuffix", def_destsuffix)
>> +            subdir = url.parm.get('subdir', '')
>> +            destdir = os.path.join(unpackdir, destsuffix, subdir)
>> +
>> +            if not os.path.exists(destdir):
>>                  return None
>>  
>>              found = True
>>  
>> -            vars = { 'repodir' : quote(url.localpath),
>> +            vars = { 'repodir' : quote(destdir),
>>                       'rev' : quote(url.revision) }
>>  
>>              rev = bb.fetch2.get_srcrev(d).split('+')[1]
>> -            rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + url.revision)
>> +            rev_file = os.path.join(destdir, "oe-gitpkgv_" + url.revision)
>>  
>>              if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
>>                  commits = bb.fetch2.runfetchcmd(
>> -                    "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
>> +                    "git -C %(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
>>                      % vars, d, quiet=True).strip().lstrip('0')
>>  
>>                  if commits != "":
>> @@ -107,7 +114,7 @@ def get_git_pkgv(d, use_tags):
>>              if use_tags:
>>                  try:
>>                      output = bb.fetch2.runfetchcmd(
>> -                        "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
>> +                        "git -C %(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
>>                          % vars, d, quiet=True).strip()
>>                      ver = gitpkgv_drop_tag_prefix(d, output)
>>                  except Exception:
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118982): https://lists.openembedded.org/g/openembedded-devel/message/118982
> Mute This Topic: https://lists.openembedded.org/mt/114745266/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


