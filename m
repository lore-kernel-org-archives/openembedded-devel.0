Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMyXY-0001b3-7a
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 09:20:32 +0200
Received: by bwz14 with SMTP id 14so237413bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=kW+iA1lNcuM6MVdt67u5kicdXB/ZGXSibdJbTk5VoPo=;
	b=i0rU9uBe8JwyHsQI3CDpI4jcPnCTyYZ8SkJasL32jBQ6M0Dmq3PJDQ4ZEhEAOYLKVx
	NVluImmpFCVf7RPqc7EFjtokAn4Thw2/WQzaiicagSkr1eb+vP3CqaquT19qwSwDIERS
	3D+fAHzc4p7TKT2YbNPNzSTn+XIOrrUE1KpEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ugoZq5aS8i+Z3ZvFlhw58yBdr2oii+mgz4HBZepZMzSUiRFWgLL/cgu0yKIig8+Q3k
	IpeeA4rdH3GAtw/mP/+BP+0E/x8LTN/16A8F2LeqWk5z56qaetm2OY4tFvOPA5/qsTMW
	W74qKUvFmVyMOm9Y2XL5gp3G/tceE3F6pizfo=
Received: by 10.204.73.194 with SMTP id r2mr960796bkj.153.1276240570173;
	Fri, 11 Jun 2010 00:16:10 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id f13sm3695253bka.5.2010.06.11.00.16.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 11 Jun 2010 00:16:09 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMyTI-0003Nf-Uw; Fri, 11 Jun 2010 09:16:08 +0200
Date: Fri, 11 Jun 2010 09:16:08 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100611071608.GA12908@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
	<AANLkTineM41WJ4f65imRWGkml5-dbdFvHG842UlYkgUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTineM41WJ4f65imRWGkml5-dbdFvHG842UlYkgUQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Fri, 11 Jun 2010 07:20:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 10, 2010 at 03:56:30PM -0700, Khem Raj wrote:
>On Thu, Jun 10, 2010 at 1:27 PM, Chris Larson <clarson@kergoth.com> wrote:
>> On Thu, Jun 10, 2010 at 1:22 PM, Phil Blundell <philb@gnu.org> wrote:
>>
>>> On Thu, 2010-06-10 at 12:55 -0700, Chris Larson wrote:
>>> > Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
>>> > kernel/machine support for it to be useful, along with distro support?
>>>
>>> I don't think it's machine dependent in any meaningful way; there is, to
>>> my knowledge, no OE-supported hardware which is actually incapable of
>>> supporting ipv6.  Any distro that wants to use it just needs to make
>>> sure that the kernel support is present (either built-in or as a module)
>>> on all the supported targets.  In any case, most packages will cope
>>> gracefully with ipv6 being selected on in the configuration and then
>>> found to be absent at runtime.
>>>
>>> If you start factoring MACHINE_FEATURES into that kind of decision then,
>>> logically, the package needs to have PACKAGE_ARCH=${MACHINE}.  I don't
>>> think it would be a very good thing to start forcing packages down that
>>> path unnecessarily.
>>
>>
>> Fair enough, that seems reasonable for this particular case.  Now that you
>> bring it up, we adjust package arch to machine when we use a machine
>> specific file:// file, but maybe we need to teach it to check for references
>> to MACHINE_FEATURES or COMBINED_FEATURES, somehow.
>
>will it force recompile then if I choose a similar arch but different
>machine say (qemuarm, osk5912 both are armv5te)

No, unless you end up with
- different tune-*.inc
- mmu/nommu or floatingpoint support


