Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsWM9-0002po-P4
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:43:11 +0200
Received: by gya6 with SMTP id 6so1673063gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hU77Zc3jNOAidMkjML5eitVP2zdPQ5eSlyxdYUy5zL4=;
	b=oBc22rgrnjTZUjMPJo+RiBkXaiSE7LHC4Xu6U4qK9EUtxnoVN/VORGcTDm12+crBCj
	ka8YP1pr6F/3HjFfw1frexMzfVXLof1zit/cQT1aHAAYv9lFbWC3S2gMoiIYvkPtFIlJ
	yZfocFlB/wyRGOcqM3GG8IyJ+KXT/VWvb3ysw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xwnyOBRqObEceCC/RII+VsqcMqa2axPUQpJF8HDvURGrvdrxh19+beVJVIyavq4cGk
	+VfyAreaVjfHOA60UCf/itX7nOZLfIojqvztKITTgZLV0a1Kz2T8uAmhL6qhSimZ9EqS
	GJn5VffaawJABP8cB1qb49HhASTFd5HHFFpYo=
MIME-Version: 1.0
Received: by 10.100.7.17 with SMTP id 17mr1263719ang.21.1283758950213; Mon, 06
	Sep 2010 00:42:30 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 00:42:30 -0700 (PDT)
In-Reply-To: <20100906041418.GD5320@gmail.com>
References: <AANLkTi=AYdkOG3e-DmhTNqULsCFHW2bvDGr+M0xTs0HJ@mail.gmail.com>
	<20100906041418.GD5320@gmail.com>
Date: Mon, 6 Sep 2010 09:42:30 +0200
Message-ID: <AANLkTikTnJsYNur+inxCCSVqnZeOBNgAot_hKeQO0Y-O@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: base_files 3.0.14 has dangling symlinks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Sep 2010 07:43:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Khem Raj <raj.khem@gmail.com>:
> On (22/08/10 10:54), J. L. =A0wrote:
>> While trying to do a new image I came across this error is it anything
>> to worry about? Or something that needs to be fixed? =A0Here is the
>> error:
>>
>> NOTE: Running task 8590 of 11052 (ID: 251,
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/base-files/base-fil=
es_3.0.14.bb,
>> do_package)
>> NOTE: base-files contains dangling symlink to /media/net
>> NOTE: base-files contains dangling symlink to /media/card
>> NOTE: base-files contains dangling symlink to /media/ram
>> NOTE: base-files contains dangling symlink to /media/cf
>>
>
> Worth looking into them I guess. Sometimes they may be ok when they appea=
r
> on root file system on target
>

These might not be problems on the target.
e.g. /media/cf seems like a place where a CF card is mounted.

Frans


