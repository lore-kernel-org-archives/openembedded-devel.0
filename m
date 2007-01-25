Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HA3ya-0007MI-BS
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jan 2007 13:45:43 +0100
Received: by wr-out-0506.google.com with SMTP id i7so393812wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2007 04:45:10 -0800 (PST)
Received: by 10.82.152.16 with SMTP id z16mr1020670bud.1169729108059;
	Thu, 25 Jan 2007 04:45:08 -0800 (PST)
Received: by 10.78.170.8 with HTTP; Thu, 25 Jan 2007 04:45:08 -0800 (PST)
Message-ID: <f96d234e0701250445h75a9aec6qc0a6a1f0c729a9e5@mail.gmail.com>
Date: Thu, 25 Jan 2007 07:45:08 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45B820C1.1090100@whitby.id.au>
MIME-Version: 1.0
References: <45B40165.6000506@whitby.id.au>
	<45B4EDCD.1060609@dominion.kabel.utwente.nl>
	<45B50D16.8060001@whitby.id.au>
	<45B518A5.8000500@dominion.kabel.utwente.nl>
	<45B5528F.3050108@whitby.id.au> <45B59FD0.1000207@whitby.id.au>
	<45B6609B.5080909@linuxdevelopment.de> <45B66852.6020801@whitby.id.au>
	<45B820C1.1090100@whitby.id.au>
Subject: Re: RFC: customisable pivot-root functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jan 2007 12:46:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/24/07, Rod Whitby <rod@whitby.id.au> wrote:
> As part of the "remove all slugos-specific stuff from OE, and make it
> generally useful and available to multiple distributions" effort, I need
> to replicate the current slugos-init pivot-root functionality, and I
> want to do it in a way which might be useful for other OE platforms (or
> at least is not tied to one specific NSLU2 distribution).  At a minimum,
> I want to use it for a derivative of Angstrom, which I'm calling
> "MokoSlug" and possible retro-fit it into the Unslung firmware too.
...

> 2) Would this functionality be of use to any other devices that use OE?

Yes.

> 3) Who else is interested in giving input to, and reviewing the output
> of, this effort?

Yes, I'm currently working on two projects that will required the
ability to do field updates -- (stick a USB stick in the device and it
updates itself).  I'm currently planning to have a small RO update
image (which never gets updated) that is smart enough to update the
main rootfs and then pivot-root to it.  It would be nice if this could
be made somewhat general as it is probably a fairly common
requirement.  Another reason for the RO update image is to be able to
easily recover if the main image gets corrupted.  I'm not sure if
there is anything in common with your slug work, but It would be nice
to have a general framework available to do the pivot-root stuff.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


