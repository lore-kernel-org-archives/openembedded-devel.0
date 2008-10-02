Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KlMQV-0008K4-VJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 13:33:00 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1443632rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2008 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=7ZHxG36y9Kk6bfWmVy6TjLzvrC1QXKszaCxsc5gplxY=;
	b=FlkwIQiw7hPHjtOlz9trYY6X+Qe7HuCaaT9v/rihSoXswSxIVehGPUEj2qhNABIuzP
	XXX7wa9SnNr1phQX+h0fobBuLntcevfs0DXviiupYbY/4w5+1/uBta6a2sWr2kwEbezM
	CwEM+4WrBDsyjXjgqNZHa+sJ7dcNqWNjHaRcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ZwgoCBSUixGXTZXKlHdd47yDgGE1WYGcuTsnZl32ptcpw6YwHR26Unk1yne2ZLxMG6
	FhUd7ffjlZm3A9l/K7HvNGY/6besueLzu1uisfWhVR9Xuj7m1GkjU8KdrK1TKOPXmJoj
	CdwLyosU997cyaGafV4NgUrAOtr7fGLGyWu8E=
Received: by 10.141.164.13 with SMTP id r13mr5184304rvo.53.1222946927421;
	Thu, 02 Oct 2008 04:28:47 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Thu, 2 Oct 2008 04:28:47 -0700 (PDT)
Message-ID: <f96d234e0810020428g78256acfpdcf046cf9136fa27@mail.gmail.com>
Date: Thu, 2 Oct 2008 07:28:47 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810020236.47828.zecke@selfish.org>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee>
	<200810020236.47828.zecke@selfish.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Thu, 02 Oct 2008 11:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 1, 2008 at 8:36 PM, Holger Freyther <zecke@selfish.org> wrote:
> On Wednesday 01 October 2008 14:24:56 Kalev Lember wrote:
>> Hello,
>>
>> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=summary
>> The master head of org.openembedded.dev is not updating. I already
>> spotted two bug reports (4584 and 4590) which reported issues that were
>> fixed in monotone 4 days ago, but never got into git master.
>
> That is on purpose. People complained on irc that CIAbot reports everything
> twice (master, org.openembedded.dev)... and there is no real reason to have a
> branch called master.

Hmm, and someone must have just fixed the repo so that a clone
automatically checks out the org.openembedded.dev branch, and there is
no master branch :-)

cbrake@happy:/build/tmp/org.openembedded.dev$ git branch
* org.openembedded.dev
cbrake@happy:/build/tmp/org.openembedded.dev$ git branch -r
  origin/HEAD
  origin/org.openembedded.dev
  origin/org.openembedded.documentation
  origin/org.openembedded.dreambox
  origin/org.openembedded.entity
  origin/org.openembedded.stable
  origin/org.openmoko.april-update
  origin/org.openmoko.dev
  origin/org.openmoko.xora.qtopia
  origin/org.openmoko.zecke.april-update
  origin/org.openmoko.zecke.autotools-bustage
  origin/org.openmoko.zecke.random-breakage

http://wiki.openembedded.net/index.php/Git updated

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


