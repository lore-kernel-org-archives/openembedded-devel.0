Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KqnMK-0001H8-Ua
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 13:19:09 +0200
Received: by rv-out-0708.google.com with SMTP id f25so570210rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2008 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=QF9jYu3NVmHQNd/Ru7OS7/xWUw5GtY8izw0vr+os/M0=;
	b=sO2oiY1OcPMpiC8lxUek2znjhucxYUPzAwafHAsM8Q9ipekEe5NzAmXnPcWNXA1Bq5
	gJ70MyPbjStN6UmCisetn1Pgo7mIuInro4w8KJmdBEcy5kKVpAJA0+vbgCpy5TpAYcZX
	npfuxGKwS17SyTWIQlH9lu0jT8zoj+oF1bHnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Hl5Ez1grTNvu6c52rv2l2TOYsiidtFqLgBqeY6avs0ha1gnvW/fk2VVsw0fwAX8/DN
	xQMYrzWjELMkRBvbtSmQo0sOCMuLUcSbOlyGu+xobIyENFkGCYA0IBrYASNUvEXXJjnL
	I3WYYBfVQrTGrOl8RFGGJc/aigDFzYwNY9vXQ=
Received: by 10.140.226.13 with SMTP id y13mr2455687rvg.2.1224242343475;
	Fri, 17 Oct 2008 04:19:03 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Fri, 17 Oct 2008 04:19:03 -0700 (PDT)
Message-ID: <f96d234e0810170419r69e34fddt4494fa1cbda3baa@mail.gmail.com>
Date: Fri, 17 Oct 2008 07:19:03 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48F825DE.90104@miromico.ch>
MIME-Version: 1.0
References: <48F825DE.90104@miromico.ch>
Subject: Re: Adding support for our
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
X-List-Received-Date: Fri, 17 Oct 2008 11:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Oct 17, 2008 at 1:42 AM, Alex Raimondi <mailinglist@miromico.ch> wrote:
> Hi,
>
> We have a new AVR32 based embedded linux board (www.miromico.com/hammerhead), which is available now.
> We would like to use OpenEmbedded as our major build system to allow our customers to build their u-boot,
> kernel and rootfs.
> Of course we would like to contribute to oe, as well.

Great, welcome to the project.

> Is there such a thing as a board maintainer in oe? If yes, how can we become one?

Yes, see MAINTAINERS in the root OE directory.

> We allready adapted a few bb files to get oe building our u-boot and kernel. Should we push out these changes?
> How?

Yes, please do.  There are two ways:

1) the old way: create patch files and post to the bugzilla
2) the better way: expose a git repo somewhere with your changes and
ask for review.  Once there are reviewed, someone with OE push access
can easily merge them for you

OE push access is typically granted after a person has made some
contributions and seems to have a handle on how OE works.

> We have two developers working at this project. Our board is AVR32 based. So, if oe is our major build system we would have to take care that avr32 allway builds. This means testing, fixing, extending support. I hope this would be benefit enough to endure our newbie questions while we are getting known with the build system.

Excellent, contributions are appreciated.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


