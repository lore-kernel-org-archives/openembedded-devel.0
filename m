Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFiez-000321-9t
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 11:07:17 +0200
Received: by wibhj13 with SMTP id hj13so1192662wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=URz5d6gTNyhu7Lgw5sD760lD0h3uuTUZ/GREYmgdybI=;
	b=UzaamUwMnidJtsmWljQovzPzrnFPtLHKct4yCkx1TJF/0jkG4ovE3cKDCygbwWTWuW
	MUgP3TFctBTDPo1fOu5zRUCc8xRq4VFI7ubly0WS18ASKGXUwFDHUMkh4W/dBsYUnbWL
	zmiuPHDRkohYaHTQeuo/zBwkRVvg8uws3puoK95tZBKuB+AdnDDMY1WoD9eULku6x2tc
	YDwLo6fjx85MbG3bcXZdH4UeYeqmDkVllAF4EGVDVmiFIca5pJC/020WC8WFImA5bz+F
	UgvNQ2vHRlltRH65Ez9DbWiYwsmDryLe6h3+RCHUcIJEg59fGzOnT5c7UsINOpiOSaTo
	db2Q==
MIME-Version: 1.0
Received: by 10.180.79.72 with SMTP id h8mr11099371wix.1.1333616286028; Thu,
	05 Apr 2012 01:58:06 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Thu, 5 Apr 2012 01:58:05 -0700 (PDT)
In-Reply-To: <4237778.fYL2t0UXRO@helios>
References: <20120402210435.GA10553@hermes>
	<CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
	<CAGiJk9fvBvuR8ftcLpYXcucJPX8zaJ=6UOnbDxkq409KZcGOFw@mail.gmail.com>
	<4237778.fYL2t0UXRO@helios>
Date: Thu, 5 Apr 2012 10:58:05 +0200
Message-ID: <CAGiJk9dYMKgxKUnwEwb+HUUAS3wFsLGZYSfghsu0w6CFFHheOw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Package build failure
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
X-List-Received-Date: Thu, 05 Apr 2012 09:07:17 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/5 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Thursday 05 April 2012 10:47:05 Samuel Stirtzel wrote:
>> So if the recipe states:
>> -
>> SRC_URI = "git://anongit.kde.org/calligra.git;protocol=git;branch=master"
>> SRCREV = "92ff51b5c0f388729f466041b34ab165a7d80987"
>> PV = "2.3.87+git${SRCPV}"
>> -
>>
>> Will it still look up the remote SRCPV instead of using the SRCREV?
>> Is there a "best practice" or something like that?
>
> No, if the SRCREV is a full commit hash as above then it will not look it up
> remotely.
>
> Cheers,
> Paul
>

Thanks for the clarification,
and sorry for hijacking this thread.



-- 
Regards
Samuel


