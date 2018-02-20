Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5C7A7875F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:52:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y8so7447207pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=E5L69j6rEir0O5rYcw0MgufbDcdtmtS8+RoUTyj7COo=;
	b=cB3fRDJjuP9waal0kY6wlY0rKYDVuvqvxgy53umU4nsbI45L7I/jw96YHS5jqO1GS+
	7iOVHihReEkcHa2pGYH0LE8B4wfFPLD4+R6AknDRTj6p0cs/7/n6jJJ0Hp1HhZaoUP6G
	5R0A8d4WRATPXROzQU2R/OtW9hFhbPdXe2/vuHhWdhygYDkUSc1kNmJaD/84iVijZ7qY
	8401SUBzAJ3Wi2VlSrNVBe5s1G+ZD+UAcoLIRb+UI93u8q2q7ENBU2ukVwwrhdq578v5
	AUdW70A9GG1rXB55LshalZdcpwh1tvv4ByxWOVGK0y9I2PCkTqTfppzcVwOZvIDrWTWb
	C0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E5L69j6rEir0O5rYcw0MgufbDcdtmtS8+RoUTyj7COo=;
	b=fM6ZenwgMw3bm/m6XVDQBIexyFnFFO9sS/lPgUZf0vf1YzoCtN7LdAAP9ZibeTpGzn
	Ue/oRpj4PNes9b44ptC3tJojh+u/Mc0lLsEeb/EOi7CvTmWuiKMkTr5df+4fRzXPbNUK
	8wwF9U4xToWIhDAnbQelIv8xIBAYQV7Nnm2A+lMos8uKZ7igGxwzpY5jVvYP6sZ/yWs+
	DbNKCHS8oxjHPD6+R0YicKmMHrO+rKZIQHaTmQbCMHwX/BH1bNuaQ5jxZfFyH1zcvOe+
	oMbfK3M/fDbEl+9CzlGHxgF4Vvac7d3lTLdZhg/LKs8WhAvVv+9+PgTYx2xFyFvzfpne
	JasQ==
X-Gm-Message-State: APf1xPDrb3qwH1DA5C6GQIrThs2UBhk4CDMf7NSuwBwLdIE/d2MR5sGk
	YBMr2fjv0IYyDJPLuYgLnD/ul8+c
X-Google-Smtp-Source: AH8x226asLDY4k5D3Wu1LaY5Bvo8anTu98MULrJj+uTy9RzIhw7cajRrE3ODTC6klxfjUPxvK71TTw==
X-Received: by 10.99.116.70 with SMTP id e6mr479248pgn.256.1519152745836;
	Tue, 20 Feb 2018 10:52:25 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:1018:c2d5:2fd:6d43?
	([2601:646:8880:466c:1018:c2d5:2fd:6d43])
	by smtp.gmail.com with ESMTPSA id
	w63sm10750614pgb.80.2018.02.20.10.52.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:52:25 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	akuster808 <akuster808@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
Date: Tue, 20 Feb 2018 10:52:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 18:52:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/20/18 9:13 AM, Bruce Ashfield wrote:
> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>>> Hi,
>>>
>>> Is now a good time to talk about splitting up meta-oe?  Some layers are
>>> actively developed and maintained (one example: meta-python), others are
>>> basically bitrotting and only get touched when something else causes them
>>> to break world builds (one example: meta-gnome).  I've long felt that
>>> meta-oe should be split up and the high quality layers managed in their own
>>> repositories so patches to them don't get held up by breakage in other
>>> sub-layers.
>> You make it sound like meta-oe is not a high quality layer.  I could
>> make the same claim about oe-core master.
>>
>> I don't see the connection in patches being held up due to breakage in
>> other sub layers. This only happens if the dependency fail to build.
>>
>> You lose control over the quality in current layers that reside in
>> meta-openbedded just like you have no control over all the other layers
>> residing in the community. It makes maintaining stable versions very
>> difficult. Well, unless The Yocto Project takes over them.. I guess that
>> would work then.
>>
>>>
>>> Another advantage of splitting out the high quality layers is that we'd
>>> like to look at running more community layers through the Yocto
>>> autobuilder, and granular layers make that easier to manage.
>>  I thought not including layers in bblayers.conf was easy enough.
>>>
>>> Comments?
>>
>> What problem do you thing you are trying to solve here?
> 
> My unrelated issues are that I can't update one layer, without getting
> all of the updates.
> .. but that is both a good thing (i.e. they are all tested together,
> so you know that the
> single SRCREV update is good for all layers), and a bad thing (when
> you just want a
> new python recipe update from meta-python, but don't want other changes).
> 

if you dont include the layers in your BBLAYERS and they become
effectively non existent, unless you are on metered internet connection,
where downloading unused stuff would save you bandwidth, it should be
ok.  No ?

> It is very likely that splitting the layer would help one issue, but
> make the other worse.
> 
> So no solution from me, just an observation about potential issue.
> 
> Cheers,
> 
> Bruce
> 
>>
>> - armin
>>>
>>> Ross
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 


