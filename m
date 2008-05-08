Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ju3A8-00015N-Sj
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 12:15:45 +0200
Received: by an-out-0708.google.com with SMTP id b38so149213ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=C8BSl2BLWMnfrvbqivenjtfblizMpQPG69JRVPFmKRk=;
	b=mxx89+9aF8s71JpaJPDYgXEtL4tiiBtslya21llr9xzbr0+1HYgJ7uounqdXyZBwCkpCtPkdR+rSpbHFtVATk9o9/AQN7Cykktr6h/2c0rNltfgWUrKnEreY9h6/ZSEv//84YQYpKAA/IHGLeLwUPtg01v3yyba5bcboqMq+I/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=niIm23C0dOHEQ+WzgGTnUGHg4w7QvVCjZ+MhqF3r6HuUnOBP0XfTBc8DQu7nwRbU2nhXbv86QNBzUfXTZPdoCZJKpX20DRRx8ChIn10qel0KfVXMePBHYg9BJIL83tXJwO8H0W1dN+eFMo+yCdpoih10rwsjPdGlrPliwXr2XbU=
Received: by 10.100.152.19 with SMTP id z19mr3976538and.80.1210241704485;
	Thu, 08 May 2008 03:15:04 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Thu, 8 May 2008 03:15:04 -0700 (PDT)
Message-ID: <c384c5ea0805080315o4aea668av311a9a6374db68e1@mail.gmail.com>
Date: Thu, 8 May 2008 12:15:04 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fvuc31$vci$1@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0805071507u747f820fga7e797c26243a367@mail.gmail.com>
	<fvuc31$vci$1@ger.gmane.org>
Subject: Re: [RFC] Auto bi-sect build server idea
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 10:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On Thu, May 8, 2008 at 10:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > Define a few local.conf's that are known-good.
>  What is different between those confs? I haven't edited my local.conf in
> months and still build different configurations every day.
>
Ah yes, you specify stuff on the command line prior to building?

MACHINE=foobar bitbake etc.?

> > if the build completes, tag the revision as "last known good".
> > if the build fails, tag the revision as "latest known bad", and
> >
>
>  Tags would be a bad idea, we can use certs with monotone, which allow a
> free-from key:value structure, so you can do
>
I didn't mean tagging in the SCM context, just local to the build
server (i.e. local to the bisect script). Should have made this more
clear, as I don't intend to clutter the OE mtn db.

Should check if mtn supports bi-sect, otherwise cook up a script that does this.

Regards,
 --
Leon


