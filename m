Received: from mail-yx0-f191.google.com ([209.85.210.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NsIqm-0008SH-3C
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:45:57 +0100
Received: by yxe29 with SMTP id 29so641512yxe.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=JTN4bdTIsuMowjOtW9dLeGm9Pj99CV5tC/Vndr3YHYY=;
	b=ZnS9p/UHI5vrINKOMnnWCfZFNlFjzrl+WJZtDItF8Oioeh+JUrFHNZQo+zIuK6egRO
	Za5M2JFTnV1ba2M96rZd+tWm6Q6zWSd3Kh/TLwvzoJ/zmRcQk6DP83lsLKF5/mfTdy5q
	FsIfRTdwlYJqpdUkVaZws6VrkvxQNFwGkJG3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IXjPB9elu6h6MNNMh+2AYrANT4NhU6v888rDA+iTitJexH5a3UlWi2P6ba2am9+F9r
	ph3bHJx1zmjaIm9NH4d1TV3l32mMJyIbd3j5zKMIflWry8wym7fd0oeg9qyIKYvBLQ2A
	iOjiFMMRCssTslqYmGnDiR914TAuY7BclDWgk=
MIME-Version: 1.0
Received: by 10.90.136.2 with SMTP id j2mr1808773agd.92.1268930549180; Thu, 18 
	Mar 2010 09:42:29 -0700 (PDT)
In-Reply-To: <19c1b8a91003171600u10444eb8obd60b8fceabd62f4@mail.gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<20100316190003.GA20970@excalibur.local>
	<d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
	<19c1b8a91003171600u10444eb8obd60b8fceabd62f4@mail.gmail.com>
Date: Thu, 18 Mar 2010 10:42:29 -0600
Message-ID: <d1ded4381003180942n39cf2e4er2e88cfc5fa0c951e@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.191
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/7] device_table_add-xsa: add dev nodes for system ace
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
X-List-Received-Date: Thu, 18 Mar 2010 16:46:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

My host OS is
Fedora 12 2.6.32.9-70.fc12.x86_64

Gcc version installed in my system
gcc (GCC) 4.4.3 20100127

which is the late's version available

cleaning and rebuilding gcc-cross doesn't make the error go away

A complete log can be found at [1].

[1] http://pastebin.com/BftKvgGA


Regards

On Wed, Mar 17, 2010 at 5:00 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Mar 17, 2010 at 3:00 PM, Adrian Alonso <aalonso00@gmail.com>
> wrote:
> > Hi,
> >
> > I tested on my previous build and everything is ok (tested
> console-image);
> >
> > Building from scratch arise a build error with "gcc-cross_4.3.3.bbfailed"
> > I'm going to track the changes in gcc-cross recipe to find out why is
> > falling
> > The complete error log can be found at [1].
> >
> > [1] http://pastebin.com/2m4TP2Vs
>
> seems more like your gcc on host is causing the problem here. What
> host os do you have
> and try to clean and rebuild gcc-cross that might fix it.
>
> >
> > Regards
> > Adrian Alonso
> >
> > On Tue, Mar 16, 2010 at 1:00 PM, Stefan Schmidt
> > <stefan@datenfreihafen.org>wrote:
> >
> >> Hello.
> >>
> >> Back from holiday I found the time to test your patches. I needed to
> adjust
> >> one
> >> manually due to a change going in between but that was easy enough.
> >>
> >> I tested and pushed them out now. Please test on your side if everything
> is
> >> ok
> >> and thanks for your contribution.
> >>
> >> regards
> >> Stefan Schmidt
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > Saludos
> > Adrian Alonso
> > http://aalonso.wordpress.com
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

