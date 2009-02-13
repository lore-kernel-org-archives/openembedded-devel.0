Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LXzlI-00023S-SK
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:15:28 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n1DF90xh006059;
	Fri, 13 Feb 2009 07:09:00 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Feb 2009 16:14:00 +0100
Received: from Glamdring ([172.24.49.65]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 13 Feb 2009 16:14:00 +0100
Message-ID: <006b01c98ded$b05e37a0$413118ac@Glamdring>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@openembedded.org>
References: <200902131525.34787.openembedded@haerwu.biz>
Date: Fri, 13 Feb 2009 16:12:01 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 13 Feb 2009 15:14:00.0479 (UTC)
	FILETIME=[B2E382F0:01C98DED]
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 15:15:29 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit



>
> Hi
>
> I was talking during FOSDEM with some developers and one of things which
> I was asked about was 'how to create machine config' (usually question
> was other but had this sense).
>
> OE developers usually know that machine config is simple but tell that
> to Joe Random who only knows that his board use s3c2443 etc. So idea was
> to create simple few steps wizard which will ask few questions and
> produce machine config as result. More work would be required on
> creating kernel recipe because kernel can be from svn/cvs/git or tarball
> + quilt patchset etc...
>
> Thats only beginning of idea - I hope that someone will provide
> feedback.
>

Yes, this is one of two major drawbacks of OpenEmbedded.
The second beeing buildtime.

Should it be possible to use KConfig?

For Buildroot, I have generated a Config.in which
allows you to specify any kernel version from 2.6.22 and onwards.
You can apply any minor patch, -mm patch or -rc-# patch.
You can also apply an architecture or board specific patch
as well as a named patch from the download directory.

When you apply an architecture specific patch, you have a list
of patches to select from so you could apply the 2.6.17.6 patches
on top of 2.6.17.12.

Would be good to be able to download a patchset as well, but this is not yet 
supported.

Best Regards
Ulf Samuelsson

> Regards,
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




