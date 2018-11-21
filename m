Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id C9AB16C514
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 14:38:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id a14so5800810plm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qDjF+UEb9pDM+Ya/GR2507bW3cvrn4dDmpqEShfV/ms=;
	b=q4f1XHv8hwFRjdT5ptbVzZOLNdgCinybbzGsOQeJpw+s5R4Jcgu49z2XNWGdZ3nvfW
	MdKTelYlN5uxtE+slStWVEOws7HnHH3Iu8JnMHGgrvusVRAkDspOqbtDyaiDSzFmFBvl
	XC/IUJtw2l3hvBFWyYDMHthEt4rE5+9wXo+6rmwawggXw2YGROhDYwgMnGYfCLzLnM6Y
	18+43DE6y4iRX1j88Wyzgf+t1ug/d7rYzHFUNsqicbqjM34w62KOoR1KI4iqvdap7HrH
	l2TUUIip8mTESsJc1aLyS33nxpm8nrNSmTWGWcNcW9+HKGGyyYAIQq71+CoEnsWj4eT8
	yvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qDjF+UEb9pDM+Ya/GR2507bW3cvrn4dDmpqEShfV/ms=;
	b=c7UOFsUpM3293X741Xr8AbF9Xolt6rc0vdn5IwkU5PHjREQrxOGvD3pmWvEdpH50dv
	mQEY8v8dJg0HFb+Lbxu+FEgqRxZ0SrEFbHkY+kqqBoSa9Hakn0FP4hDudbSni0Y+Ul2E
	yQYlkv46rd7cnfyyCAMOa65GVbotT3ecces8DZOdCFm+dsa/VbLX3HF93zYGn8xbtI6d
	y2Mi69cCSoqDpnqaz79hPVcfNKVNZTHb4JorsRkgue/1DbTWsjF0vpxvZOe8Y5LJYBSb
	lXoti/wPakLOcWzvJVlqJc4eHavFex29KR2117oltVbJ6Rb/xyklhTPkP8NEojEyuH8O
	8sKQ==
X-Gm-Message-State: AA+aEWZ3QUeO2kjmyMaKVl+Mbgc1G3X821pqCSBFRJ/Hmj8DEwBLiZn4
	T+rcX7skgVI+FFlJ3Ejkuf6Kl9fo
X-Google-Smtp-Source: AFSGD/VBSrKWysRJCRnxqccYeBrBGjxcbh/Fvxe0F+zqmAQBA+fjRHY33/nZ/hlsusy2VRrzbC3AEQ==
X-Received: by 2002:a65:534b:: with SMTP id w11mr6218722pgr.125.1542811089474; 
	Wed, 21 Nov 2018 06:38:09 -0800 (PST)
Received: from [192.168.0.33] (97-121-174-158.clsp.qwest.net. [97.121.174.158])
	by smtp.gmail.com with ESMTPSA id
	q199sm47601744pfc.97.2018.11.21.06.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 06:38:08 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
	<e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
	<CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
	<CAMKF1srPp_W_e6ospFUzjNN1d5L6OKUExCZtxV07hU1jqO=7Vw@mail.gmail.com>
	<CA+chaQd_7P1utSGnhP6VPDSaZ_DP9gNhNx6x6TvzVVWakwXL4w@mail.gmail.com>
	<CA+chaQcWFxnFZDUpxS1zsi7RCRwXecZBqCvxqj6G2tThSpZfxg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <31956b4f-337e-82da-b7dc-ee8ff54ce80d@gmail.com>
Date: Wed, 21 Nov 2018 07:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcWFxnFZDUpxS1zsi7RCRwXecZBqCvxqj6G2tThSpZfxg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Wed, 21 Nov 2018 14:38:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thanks Martin,

Looks like this is the only failure left.

Summary: 1 task failed:
 
virtual:native:/home/build/releases/master/openembedded-core/meta/recipes-support/lz4/lz4_1.8.2.bb:do_fetch

- Armin



On 11/21/18 7:18 AM, Martin Jansa wrote:
> I've fixed known_hosts on abaco and some archives were finally rsynced:
> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/481/console
>
> but it doesn't seem to cover all found issues, please re-run the test to
> see what's left.
>
>
> On Tue, Nov 20, 2018 at 9:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> The jenkins job which does the rsync (or at least how I was doing it), is
>> still failing as reported before:
>>
>> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/480/console
>>
>> Either you're using something else now, or it still won't work.
>>
>> Regards,
>>
>> On Mon, Nov 19, 2018 at 9:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Thanks Michael for taking care of it
>>>
>>> On Mon, Nov 19, 2018 at 12:02 PM Michael Halstead <
>>> mhalstead@linuxfoundation.org> wrote:
>>>
>>>> The rsync target on on the world build machine was offline following a
>>>> reboot causing the sync to sources.oe.org to fail. The rsync target is
>>> now
>>>> configured to be available following reboots and the sync has run.
>>> Please
>>>> let me know if this test still fails.
>>>>
>>>> On Wed, Nov 14, 2018 at 8:19 AM akuster808 <akuster808@gmail.com>
>>> wrote:
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>


