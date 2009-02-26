Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1Lcl4q-0004yf-3S
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 19:35:20 +0100
Received: by rv-out-0708.google.com with SMTP id b17so701458rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ozCA1x0Zc1KJqqTu/4eIhWszTtn5Kd04CPGss/Vu+78=;
	b=dcnuW4WJmV+FLTPTXsBYk+r52BEgd6Gk84bkk0wRRBwlAV/cIRCl1EzrqzEKWPfPVs
	wRqvrsg9xX4MxSgkoX1H5Hp6NLiCDn7UC5ExBY/8QcVdKFzFwhMm/GZMe+BAmAdpaAmi
	XZ/Lrogee3Rifm9I+u4JPTkzu+5blC6sjOIsk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vUruDSVkhQlX3zf2yNut0uD8GhAbvp0tIgadwqkxD2iR9C4LYZqC/eKA9hiyT6dpob
	d+fDpzKYB5SX+Bq4zyCEa7+cpzhGaLzDYzhBQ/9xHAq4PvA8qfM7q7koyVYQB6AYbF5g
	PfLPTdmx70oTI8kuydMGIhz4nKA7utRtDWlsw=
MIME-Version: 1.0
Received: by 10.140.127.13 with SMTP id z13mr777251rvc.30.1235673118796; Thu, 
	26 Feb 2009 10:31:58 -0800 (PST)
In-Reply-To: <49A6BFA5.4070405@xora.org.uk>
References: <go4amc$h30$1@ger.gmane.org> <go6ah4$cud$1@ger.gmane.org>
	<49A6BFA5.4070405@xora.org.uk>
Date: Fri, 27 Feb 2009 02:31:58 +0800
Message-ID: <565965130902261031h3d21c452w51b8d1217cebde54@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Opkg devel List <opkg-devel@googlegroups.com>
Subject: Re: [RFC] update opkg* SRCREV to 201
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
X-List-Received-Date: Thu, 26 Feb 2009 18:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
   Koen and Graeme Thanks.
   To my understanding, the fix from R197 to R201 are some easy defect fixing.
Fixing some typos, memory leak, and giving initial value some variable.
There were no big change in these versions.
Therefore I didn't bump up versions here.
   There are still some issues in my mind and I am still finding large
chunk of time to deal with them.
   1. the algorithm calculate the dependency is not very efficient.
(Much faster than R180 now, but I know it can be faster) Because of
there were some duplicated code and ill structured code from ipkg, I
need to refactorying them first before changing the algorithm.
   2. memory leak problem, ipkg were designed for running once and
exit, and therefore there were many place are not took carefully.
Thomas and I already fixed a lot, but not all of them. Most of the
largest memory leaks were fixed, however there were still some small
leaks need to be find out. Especially libopkg is used as library, this
should be take care well. (If anyone find a leak, please report or
help. thanks)
   3. memory hungry issue, opkg will eat a large amount of memory if
you have many packages metadata. This may cause problem, however there
is dilemma. Storing metadata will make opkg faster, but may cause very
limited device run out of memory. Saving memory will cause cpu busying
malloc and free all the time, and it will be very slow. Though the
algorithm now seems to be okay, for device having so many packages
should be powerful enough. XD I am considering adding a flag decide
which policy (fast or save memory) to use while building opkg.
   4. buffer over issue, some of the code did not check the boundary
well. Actually R197 is fixing an buffer overflow issue, in which not
be found for a long long time until it cause problem (on x86_64 arch
only). >_<
Many code needs to be reviewed/tested again and again to make sure the
quality is good enough, and it's need your reports, help and patches.
  If I break anything, I am sorry.  And please mail to
opkg-devel@googlegroups.com poking me, creating a ticket with
backtrace and some analysis to
http://code.google.com/p/opkg/issues/list  is good, sending a patch is
even welcome.  When I realize if it cause serious problem to you, I
will try to fix it asap.  I will be glad if every opkg user does not
aware it's existence, except the developers.
Thank a lot.

Cheers,
Tick


2009/2/27 Graeme Gregory <dp@xora.org.uk>:
> Koen Kooi wrote:
>> On 25-02-09 21:46, Koen Kooi wrote:
>>> Hi,
>>>
>>> I was getting seriously annoyed with the useless error codes opkg was
>>> giving me and Tick pointed me to:
>>>
>>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>>
>>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>>> as well, which means instead of adding a few patches I can just bump up
>>> SRCREV to 201.
>>>
>>> What do you think?
>>
>> Noone is thinking anything?
>>
> Sorry been AFK, my opinion of these things is always no-one will test
> until stuff is committed anyway. So you might as well go ahead! Without
> the bug reports tick won't be able to improve opkg.
>
> Graeme (XorA)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


