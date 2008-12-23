Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <erinyueh@gmail.com>) id 1LF88a-00031i-RX
	for openembedded-devel@openembedded.org; Tue, 23 Dec 2008 15:21:33 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2548072wfc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Dec 2008 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=5pAMSmAjvoIgwty3KpolNu+eSw6jUExVb6ygiJ9+jvg=;
	b=jdSfsR3xyN+t8paUjwEuIorhhiayhsbnlOK+JNa/tFAiXDqMjeN3a7lMnx532IjavF
	W4cAhaKlQW5qZD3aHYH0N25O6xOelQRBv177iQo089phZS9/Ez/w0KWEo/o4XCR0cTLV
	xtn1heoCkiR6JvG7EdGBsxRLx83pgOCLMx0Bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=QPn8eESYgcQh2ACw+i8RwRwq123lw4u7k1+yNYQWkLR5hUheDCPoG8D3VYvzk4HVSR
	ACAoF+z6i0qGtI3wQF3q1pEC7tKJe9uKwbhMqzkyawBGgKS2eA8R4l9DlJNsptjC16Gq
	e8ZRogxF3RF74mcqPYSykqo3Opm1VY33DGUBI=
Received: by 10.142.199.10 with SMTP id w10mr3179089wff.345.1230041794597;
	Tue, 23 Dec 2008 06:16:34 -0800 (PST)
Received: by 10.142.50.11 with HTTP; Tue, 23 Dec 2008 06:16:34 -0800 (PST)
Message-ID: <9d3a8b020812230616k2a20e2ebi8854c7f736eae285@mail.gmail.com>
Date: Tue, 23 Dec 2008 22:16:34 +0800
From: "Erin Yueh" <erinyueh@gmail.com>
To: "John Lee" <john_lee@openmoko.org>, openembedded-devel@openembedded.org
In-Reply-To: <20081223134143.GN2135@buddha.tw.openmoko.com>
MIME-Version: 1.0
References: <20081223134143.GN2135@buddha.tw.openmoko.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [k.kooi@student.utwente.nl: Re: Please review john_lee/openmoko-merges again]
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
X-List-Received-Date: Tue, 23 Dec 2008 14:21:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

About this patch, this argument is for storing received files via bluetooth.
How about using '/var/obexpush', not '/var/tmp/obexpush'?

Regards,
--erin


On Tue, Dec 23, 2008 at 21:41, John Lee <john_lee@openmoko.org> wrote:

> Hi Erin,
>
> What do you think?  What the appropriate setting here?  You can reply
> him on openembedded-devel list.
>
>
> - John
>
> ----- Forwarded message from Koen Kooi <k.kooi@student.utwente.nl> -----
>
> To: openembedded-devel@openembedded.org
> From: Koen Kooi <k.kooi@student.utwente.nl>
> Date: Mon, 22 Dec 2008 13:11:05 +0100
> Subject: Re: [oe] Please review john_lee/openmoko-merges again
>
> On 22-12-08 11:09, John Lee wrote:
> > Hi,
> >
> > I have reduced this to just 5 commits.  Most of them should be okay
> > except I'm not sure about this one:
> >
> > commit 4d6693ebd979092a747a66cb1828b8b4af452b28
> > Author: Erin Yueh<erin_yueh@openmoko.com>
> > Date:   Tue Dec 2 13:57:18 2008 +0800
> >
> >      obexpush_1.0.0.bb: add opd_args file to append arguments for
> starting
> >      opd
> >
> > Please review and comment, thank you!
>
> I don't think pointing a daemon to a user homedir is acceptable behaviour,
> much less pointing it /home/root.
>
> Would /var/tmp/obexpush be an acceptable path?
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> ----- End forwarded message -----
>

