Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C6CC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:15:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.38683.1707905708372555331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdHBXRHJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33b401fd72bso3499057f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707905707; x=1708510507; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5QyiD07xxKa6PbH+wCWBIJldNiuXtqEL5RNx+Mg3MY=;
        b=FdHBXRHJp2H2XC4s/eB8Oqp1vBvi20ZHZa9EzvCRSEdkotUGEy5XYqeHqF/3sYuB/w
         ijxEzu4vYLV8xfZ1KXrxC1Lv5MdEBWlRmTR+oGgX3zBrIdRB3raV7inT7QwMhM+msGz/
         zfgBGaAKKsaaDFOEhn2/cpBUNNDRkRXf7awfkqwHdZsveUuXxJgPzAgoOk4j6EF8lYJk
         sf2w74ziPO2SitdhYehMNUEK1eAhnutD3QT4nbNv90z5C1rr7h5dTN/qgCROZf2fo/xw
         2h28JzoWlakF9s4WRWyHXeAxANf0ZDPjA478Cy6vH2hxuzcPTE1+uB7V1MxyWROzsA7d
         hY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905707; x=1708510507;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5QyiD07xxKa6PbH+wCWBIJldNiuXtqEL5RNx+Mg3MY=;
        b=hU2dBN1E8t7qlQiMPlSo5p6+1MRrYAuKm446Ue9OsY2kfNSUn9/iX2GHsDPHXt/HQD
         zBCXAj/EaVwc2JJxfHioJM9WisowBc5/tUL7KBGpFZRdcoFw3tqKSL+YiJbuzVJu3mLW
         AG6w55wGzH+yQ/gOkvuvK0TvTDeSlm8oOuGARiEdCrA+bU6ac0JnrCoL3bCQ2XpGbL04
         bT2yWmZfJQ6tDowQbu3ajXrsXKUjq7pV/w/RyrDELM9pv7mpjPevYV3371fZyGYuPJZv
         FSQTR6O5qL/7fOeVskszFFVN3hqK7VdO7zTkkkwEsmaRg8EyoswYzuFifqsqOtLIztN/
         WXAg==
X-Gm-Message-State: AOJu0Yz979i7rM4LBf1BBfKRRQxDHz8QJ5vCLYA7ijbIhSVxwIxKvBoi
	z17L0Ch8G602EnCkhSUI5gdDQ8Z6UEQnYFgypop9k6HkFVEWInG1
X-Google-Smtp-Source: AGHT+IFLVaa5mYlUeORci8XdGS39Fzno+hY5cVUhoH+vIE62bJCKglU6X3jrsnZ4kZp5vKr9jEiQzQ==
X-Received: by 2002:adf:a1cb:0:b0:33c:e2bc:d131 with SMTP id v11-20020adfa1cb000000b0033ce2bcd131mr1365908wrv.35.1707905706515;
        Wed, 14 Feb 2024 02:15:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWClKbuDm/a/wbigsDbIPr6fKBRiLxwek1kgL0pfP5ON5xwOzBU6f161QypHhNQkN1w+KOj3eaJ5aXnBsjoMQLbLw==
Received: from [10.139.3.34] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id bv15-20020a0560001f0f00b0033b48190e5esm11958509wrb.67.2024.02.14.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:15:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Ot96BFI0IdXUoVoFLU8BTlcb"
Message-ID: <be33ec3b-a193-459a-b252-a43fbd44b645@gmail.com>
Date: Wed, 14 Feb 2024 11:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Content-Language: en-US
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "steve@sakoman.com" <steve@sakoman.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <17B23A54B6BB5F11.15017@lists.openembedded.org>
 <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
 <12d6aaa8-1f7d-4da9-985a-8ebb2a51ebc0@gmail.com>
 <7b7a5dddfe76a38a74a2df0c441af7bfc4dd19af.camel@infinera.com>
 <ade3562aea69ab37a64d0bdf82a8bd95e97a3679.camel@infinera.com>
 <90a1eab2-8deb-4f6a-8f0d-e6fc910c10d7@gmail.com>
 <91709ae5939eb6ac546321a1c19b27b24ec6a9c2.camel@infinera.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <91709ae5939eb6ac546321a1c19b27b24ec6a9c2.camel@infinera.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 10:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108740

This is a multi-part message in MIME format.
--------------Ot96BFI0IdXUoVoFLU8BTlcb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.02.2024 10:42, Joakim Tjernlund wrote:
>>
>> Reverted and then applied again :)
>>
>> If you are interested, see the full discussion 
>> herehttps://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284
>
> Read the thread, seems to be some consensus but I cannot see it 
> reapplied again and that is why my nativesdk is failing.
> Steve?
>
>  Joakim


It's in master, but not in nanbield.

FTR, I removed oe-core from the recipient list, because it's a topic for 
openembedded-devel.

Slava
--------------Ot96BFI0IdXUoVoFLU8BTlcb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14.02.2024 10:42, Joakim Tjernlund
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:91709ae5939eb6ac546321a1c19b27b24ec6a9c2.camel@infinera.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style>pre,code,address {
  margin: 0px;
}h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}</style>
      <pre style="white-space: pre;">
</pre>
      <blockquote type="cite"
style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
        <div><br>
          Reverted and then applied again :)<br>
          <br>
          If you are interested, see the full discussion here<a
            class="moz-txt-link-freetext"
href="https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284"
originalsrc="https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284"
shash="a2cuY9cwPumsEHH+TdaHk13BCxOuqsCBeOB9fB5vVkkBpKTE1AR+mJOPI+brabD4gvJwsDA16iSmVZbUP7hez0p4mngVBGTQ/7qGhzmd7HWy1bL1PzL2sXj9WPslODBD8k2Cz0X1pKNeZ2o07ARCCPysw1e8nGa9Hy0bTVLSVd0="
            moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-devel/topic/101679410#105284</a></div>
      </blockquote>
      <div><br>
      </div>
      <div>Read the thread, seems to be some consensus but I cannot see
        it reapplied again and that is why my nativesdk is failing.</div>
      <div>Steve? </div>
      <div><br>
      </div>
      <div> Joakim </div>
    </blockquote>
    <br>
    <br>
    It's in master, but not in nanbield.<br>
    <br>
    FTR, I removed oe-core from the recipient list, because it's a topic
    for openembedded-devel.<br>
    <br>
    Slava<br>
  </body>
</html>

--------------Ot96BFI0IdXUoVoFLU8BTlcb--

