Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lbf1N-00071O-Mn
	for openembedded-devel@openembedded.org; Mon, 23 Feb 2009 18:55:14 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2142247wfc.6
	for <openembedded-devel@openembedded.org>;
	Mon, 23 Feb 2009 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=BzTUZcwiU0ly30wzfXRo4gnw80OblnV3AxmLNWyvWQw=;
	b=b7XbgwV6fe29sMxTWWRf1dZl/PVnwvAk50NwqO5+7uTqgyfW68dwBT7M1V6Xye/YtC
	B3hwLh8xe3YgYhYZyud/9Ku5YHkkf/GqMz5C+3G9FflLR7/6qeQCWNxJ8GY6VDF80Rnj
	9wCKvEFdEvIui1eY3bxz/czAIe6V0FpQkKORQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Peo5taRCAc5+C9rWGi2qSBXHElRGmi+sL8p7gm5JLx+vt0e10/H3GjHRBAmdw2jXz2
	IJbUwesle5WUJZ0hvic13xBZ0nt5Pyq9C7fwxrFPseoqlBWdJpHQV9ksqxB82r+2JAEd
	yjscufoSAnaTgSDVlBO7cJ3YkAHhxQHTDtlvY=
MIME-Version: 1.0
Received: by 10.142.142.16 with SMTP id p16mr2071368wfd.321.1235411539004; 
	Mon, 23 Feb 2009 09:52:19 -0800 (PST)
In-Reply-To: <49A1C706.6000906@techworks.ie>
References: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
	<49A1C706.6000906@techworks.ie>
Date: Mon, 23 Feb 2009 09:52:18 -0800
Message-ID: <f46da1cf0902230952x22aea3fct180aeb5bd0ab7f22@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: Christian Gagneraud <cgagneraud@techworks.ie>
Cc: openembedded-devel@openembedded.org
Subject: Re: ep93xx, ts72xx, gesbc-9302 and more (was Re: Angstrom, ep93xx, broken rootfs)
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
X-List-Received-Date: Mon, 23 Feb 2009 17:55:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Chris,

On Sun, Feb 22, 2009 at 1:43 PM, Christian Gagneraud
<cgagneraud@techworks.ie> wrote:

>
> Finally I would like to see the machines ts72xx and ts7800 officially
> supported by openembedded and/or angstrom (so that we can use Narcissus for
> example!;))
>
> I'm willing to be a machine maintainer/mentor for the ts72xx and the ts7800.
> At work we use them in lot of our products, and we decided to switch to
> OE/Angstron distro (after encouraging test results).
> What's the procedure for this exactly?
>
> Regards,
> Chris.
>

I too am working on adding support for the TS7800 to OE. I have only
been focusing on using vanilla linux kernel 2.6.28 for now. I have put
my branch of the OE sources up on github. I would love to collaborate
with you on getting this into the upstream OE tree. I also have a
TS7390 board I would like to contribute support in the future.

So far, I have been working on getting a very minimal initramfs rootfs
running off the SD card for the ts7800. I have been successful in
getting to a shell prompt using a uClibc Angstrom 2009 dev build.
There were a few problems I had to figure out to get that to build
though.

My OE git tree is available here:

  http://github.com/troth/oe-ts7xxx/tree/ts7800

I have a separate git tree for my local setup here:

  http://github.com/troth/oe-setup/tree/master

Ted Roth


