Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF47783AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:29:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so1881742wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MRU1YYPvNOegg4agcXVWKHXD2eu5mJUX+03HkIWP2P8=;
	b=sfwXKs0MSgZPGgiFNZbW3OlPViIOmBx5bxZXTmNqXrfMA8c5FsRh1/Dyk39u+HbUXS
	1oEovlGvDuYkjt9K4D8QgHcX2ViWHPwvG9yqlrznUNBhPEfTjFDZoKtSBRkmM6GNdn0X
	atQAIPUMLLsxh6po8Vn2zErS/aVP+iuh/Yx+ulJZs2cujGQ9zmscei9Li7d08MqNwri8
	1Ex2cJdVRDX97UrO+IOdlYqjek7JCuhMB3uOS7OkJ7IUCviPTeKSevesVslDscbbrwBF
	B4E2/6swkhABjjqbleCBVzw54nm0WQW7jCxzDSHnLrEybUtO6pEOPL/yWbZh9ZzpgTdk
	1myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MRU1YYPvNOegg4agcXVWKHXD2eu5mJUX+03HkIWP2P8=;
	b=tBNWwBqMu/tMVr8o29ycdYzUF3RfgjE4r6G+k0gmJ1Lm0JpYVtHE54Vlg5OH0fMeK2
	iQLsTePay0AC9SC3rfSBL/rUHmNuitAX1JtUMaHRbR+fTh5ilaZ0ZXCxaTtXcHHjc0Cu
	Mb2pvOT9Qez/4QfX/lEJ68jumFB6SMllA5Gx0z5ojcODOYl7JpnCRcxdhkPjrSK3p3Wr
	98Ilz6iG6joIX3wbn3d7ggw2EEy2ABTj1BPmEIGWlmnGjP2pRBnQ9awxtb6YMhSN9Ia/
	xGJiuSm4jTCRmgjNONLzPk0HsRgfAXJ0NfzGcSImUo3DmozQ1IkZFL0ZmWJmpXBcXo7P
	ppwA==
X-Gm-Message-State: AHPjjUgOqbF4zhBInwoqgpgI/ej6MHLOZp5Avz0Yd4LNLnayMbLbUeVo
	QG45Hr4DT8v9t8/DMmycP1OJH3TI+YMg4pcmrpI=
X-Google-Smtp-Source: AOwi7QDZxxdGF2aG0iR5IV3/MQnrwolp1ZI2ca8M89DElxJkFUOyzdTlx3XuyRzfBLMOrR1Xa5Hhr8+MY9zubvLJkVU=
X-Received: by 10.28.103.195 with SMTP id b186mr4425707wmc.101.1506101348904; 
	Fri, 22 Sep 2017 10:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Fri, 22 Sep 2017 10:29:08 -0700 (PDT)
In-Reply-To: <01a6fe17-15cc-5516-d99b-113c89e4bd3f@siemens.com>
References: <1505995283-14453-1-git-send-email-pascal.bach@siemens.com>
	<CAJ86T=WM_gReqwOCpznqzSkkGzeFtA7W72OYQzSyEGzWSyVm0Q@mail.gmail.com>
	<01a6fe17-15cc-5516-d99b-113c89e4bd3f@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 22 Sep 2017 10:29:08 -0700
Message-ID: <CAJ86T=VJ+2L_qfokGFgUP9LEvtHg6BEaaG411Jwja3OEDywFKg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: create developer symlinks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 17:29:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 12:23 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> On 21.09.2017 20:32, Andre McCurdy wrote:
>> On Thu, Sep 21, 2017 at 5:01 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>>> LuaJIT tries to call ldconfig during installation which doesn't work.
>> Presumably this stopped working recently (since host tools now need to
>> be whitelisted and ldconfig is not included in HOSTTOOLS)? If so,
>> maybe mention that in the commit message.
> I'm not sure when it stopped working. I just tried it now with Pyro ;-)
> However I'm not sure what ldconfig does in the context of cross compilation or if it makes sense at all to call it.
> My assumption was not so I decided to just disable it. But I'm happy to correct my assumption if I'm wrong.

The change is fine, just the commit message which could perhaps be improved.

Details of when or why something stopped working are very useful for
anyone maintaining release branches etc and trying to decide which
fixes to backport.

>>> This causes the .so and .so.2 symlinks to no be created.
>>>
>>> By setting "LDCONFIG= :" the call will be skipped the same as on Darwin
>>>
>>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>>> ---
>>>  meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>>> index d7477ed..1e06e34 100644
>>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>>> @@ -52,6 +52,7 @@ EXTRA_OEMAKE = "\
>>>      \
>>>      'PREFIX=${prefix}' \
>>>      'MULTILIB=${baselib}' \
>>> +    'LDCONFIG= :' \

Maybe drop the space after the = (it doesn't hurt, but looks odd...).

>>>  "
>>>
>>>  do_compile () {
>>> --
>>> 2.1.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

