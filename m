Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B52C46FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:32:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p187so60987443wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 03:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=wStaGOb8UdBVmoJJICG59lw7Y9s3z1gQ8nqoVVK51uY=;
	b=p/ogXM3cwr6Xi1oqg/tgazoPZzgZGkV1GH/gO62nomzPXAlFfzxJFNcoDiWEB1sI+t
	VJZcYN5vaOIXVwdgkQ6EKhnsfqdYj1CKaQxZCIETrC7xNlsPuw1Hb49y6Lhkt3hrXQjh
	CemYChI4VCQk2TAdZbvH9plwfTgqIY0zce7erHrELHDbNnToG+OXLKaUZeFb44GiALwk
	GHGIms6uTBdO2I54kUQ2On3jiblMUabOeGt+n841D01AkLdDDJAkTC79A5rRdJ2IXnWn
	6epJ41FqLOuvZgZA9oiisN9MiZ635ngyZ2gE5GdtXhuWNepp+0mmRmkQfowGfc9R8zsC
	WDag==
X-Received: by 10.194.133.135 with SMTP id pc7mr3384863wjb.90.1450438322702;
	Fri, 18 Dec 2015 03:32:02 -0800 (PST)
Received: from [192.168.0.15] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	vu4sm14472432wjc.2.2015.12.18.03.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Dec 2015 03:32:01 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
	<1447938897-26171-6-git-send-email-funman@videolan.org>
	<20151218112939.GC2563@jama>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <5673EEB0.5090204@videolan.org>
Date: Fri, 18 Dec 2015 12:32:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151218112939.GC2563@jama>
Subject: Re: [meta-multimedia][PATCH 6/6] VLC: do not use --with-contrib
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
X-List-Received-Date: Fri, 18 Dec 2015 11:32:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 12/18/2015 12:29 PM, Martin Jansa wrote:
> On Thu, Nov 19, 2015 at 02:14:57PM +0100, Rafaël Carré wrote:
>> ---
> 
> I'll finally merge this patchset today, but can you please fix:
> 
> vlc-2.2.1: vlc rdepends on libvncserver, but it isn't a build dependency? [build-deps]
> 
> in follow-up change?

Sure

>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index 99a6c66..ce3601d 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>  ARM_INSTRUCTION_SET = "arm"
>>  
>>  EXTRA_OECONF = "\
>> -    --with-contrib \
>>      --enable-run-as-root \
>>      --enable-xvideo \ 
>>      --disable-screen --disable-caca \
>> -- 
>> 2.5.0

