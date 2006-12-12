Received: from [64.233.162.239] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Gu6CB-0006cm-7i
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 12:53:15 +0100
Received: by nz-out-0102.google.com with SMTP id m22so937026nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 03:51:41 -0800 (PST)
Received: by 10.64.156.3 with SMTP id d3mr13058334qbe.1165924300146;
	Tue, 12 Dec 2006 03:51:40 -0800 (PST)
Received: by 10.65.230.8 with HTTP; Tue, 12 Dec 2006 03:51:40 -0800 (PST)
Message-ID: <c384c5ea0612120351w6582b13eqe857b39e4c995957@mail.gmail.com>
Date: Tue, 12 Dec 2006 12:51:40 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <457DE327.2050209@whitby.id.au>
MIME-Version: 1.0
References: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>
	<1165789441.5604.39.camel@localhost.localdomain>
	<457D151B.3050405@dominion.kabel.utwente.nl>
	<457DE327.2050209@whitby.id.au>
Subject: Re: {PACKAGE,TARGET_{,PACKAGE_,EXTRA_}}ARCH blues
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
X-List-Received-Date: Tue, 12 Dec 2006 11:53:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 12/12/06, Rod Whitby <rod@whitby.id.au> wrote:
> >>> Someone familiar with what the ixp builds should be doing should really
> >>> look at this. I've cc'd rwhitby who should know the right person to deal
> >>> with this.
> >>>
> >>> This machine might not want PACKAGE_ARCHS containing ${MACHINE} so it
> >>> might want to override that...
> >
> > I think conf/machine/ixp4xx.conf shouldn't be used, but conf/machine/ixp4xxbe.conf or
> > ixp4xxle.conf should be used instead. Each of those machines should set PACKAGE_EXTRA_ARCH
> > independantly.
>
> Agreed.
>
Then I understand that ixp4xxbe.conf must add armv5teb to this list:

PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

and that ixp4xxle.conf must add armv5tel to this list:

PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

If correct, can someone push this in?

Thanks,

Leon.



-- 
Leon


