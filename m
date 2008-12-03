Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L7fOC-0005ri-0s
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 01:14:48 +0100
Received: by yx-out-1718.google.com with SMTP id 4so1582736yxp.30
	for <openembedded-devel@openembedded.org>;
	Tue, 02 Dec 2008 16:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=OLmCEbiGjzn5GUOHxI4OSNqQ3fOKx/g3F25+LmXo8Ko=;
	b=DQVGzc3Q0RmUHdBvN6GpdkqSgC3PMbO1lqUME/EVNQZzDQSvMmCzy8mXELSP8bOVsn
	JMHvaI0qJA0KVCFu1wK6X9SvQ6ItGglIuSdNwFH1vKvgbKj53kDeCdWZex2oTiEAcTm+
	ZZ9MMrdQxMhUySY3Yi2BRNRycuJKaXNneBhs0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=DBTsM2KEnDzY62zK5yt6FtcrfOHarqX/RX5pjz8HI7K1uSnqeYmuCdm/PFFVxMp6gL
	bQMWRkkevYxMgY1oYLfo0UQYxlxcWBSpwstIGqCLNSvfPsrmNZaJ/bICwyH1rW6urToX
	6KX3NxzNebK23ndw8ticmfk5YgM8xSlUJyEWw=
Received: by 10.100.124.1 with SMTP id w1mr7267734anc.3.1228263079943;
	Tue, 02 Dec 2008 16:11:19 -0800 (PST)
Received: by 10.100.167.15 with HTTP; Tue, 2 Dec 2008 16:11:19 -0800 (PST)
Message-ID: <bc64b4640812021611y34db8237vb1c286de035b99bc@mail.gmail.com>
Date: Wed, 3 Dec 2008 03:11:19 +0300
From: Dmitry <dbaryshkov@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <20081129181339.7152fdd4@widy.localdomain>
MIME-Version: 1.0
References: <ggq1n1$85a$1@ger.gmane.org>
	<20081129181339.7152fdd4@widy.localdomain>
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: packaging question
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
X-List-Received-Date: Wed, 03 Dec 2008 00:14:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/11/29 Paul Sokolovsky <pmiscml@gmail.com>:
> Hello,
>
> On Sat, 29 Nov 2008 00:17:37 +0000 (UTC)
> Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
>> Hi,
>>
>> To make suspend work on tosa w/o problems, I have to put several
>> files into apm hooks directories. The question is: into which OE
>> package should I put them?
>
> This was discussed well once - please put all machine- and device-
> specific hacks and workarounds into separate package(s), to not
> contaminate the main device-independent package with them, which would
> either cast the main package machine-specific (QA nightmare), or affect
> other devices unexpectedly (even bigger QA nightmare). There're few
> examples of this idea already, see apm-wifi-suspendfix,
> bluez-dtl1-workaround packages.
>
> If such a package is machine specific, it's obvious where it should go
> - into MACHINE_EXTRA_RDEPENDS. If it's however a workaround for
> a particular device, especially pluggable, it makes sense to make it
> more flexible and automagical and associate with the corresponding
> kernel driver. See kernel.bbclass for how the packages above are
> handled.

Should I also bump PR of task-base after changing MACHINE_EXTRA_RRECOMMENDS?

>
>>
>> --
>> With best wishes
>> Dmitry
>
> []
>
> --
> Best regards,
>  Paul                          mailto:pmiscml@gmail.com
>



-- 
With best wishes
Dmitry


