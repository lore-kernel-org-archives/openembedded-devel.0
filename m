Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1K78dX-00055g-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 14:44:11 +0200
Received: by wa-out-1112.google.com with SMTP id j37so3170750waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=TzeXhHQfhSyAJaIsdLeeAwzyVu3jZIc13gfjbakXUbA=;
	b=X+V9ZoGxIy4jiIc3ovgay3rDcNZLYf0tWuL8RldWPYtI0y/BU6iUrvlc+QaFRz8tB0
	3i0+ZRjlMP2Vui8nHzTKZhdPy7R4nAymyzMlkVb1Xa9ZSXXUAOsd6gjiwpYWEEPYEnbk
	P0rtAgXUU7sjrSKIRTiiiypgeiTMVOUl8WlkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=XsOXyWpFtqV7BB6krS8ltsvDUCRZYCmDIrirpqU+A9m46a4fhxdwz3DO+0DTt7hKty
	3LDNunXuq7aSBp1QT8CcVmetDOkLU7It3TKZj5NE2HgCnh7CbOmCLD7GZhby7d40/ZVg
	hLlEzGZtitZR2j1ybWx+0LO9osNI0+XnFMWLQ=
Received: by 10.114.110.1 with SMTP id i1mr2965786wac.112.1213361029304;
	Fri, 13 Jun 2008 05:43:49 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Fri, 13 Jun 2008 05:43:49 -0700 (PDT)
Message-ID: <f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
Date: Fri, 13 Jun 2008 08:43:49 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 12:44:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 13, 2008 at 6:06 AM, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
> On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>> As always, there is a but. This change is conditional on being able to
>> come up with a sensible commit and review policy for OE.dev. The core
>> team does feel that the metadata quality has dropped over time in some
>> areas and we need to have a better review process. The change to an SCM
>> with good branch support is a vital part of this but not the only part.
>>
>> We've not made any decisions on what the commit/review policy should be,
>> this is open for discussion. We're thinking it may take the form of some
>> kind of kernel style Signed-off-by: tags and a switch to a partially
>> pull based model rather than just push based as we use monotone so more
>> than one developer handles any given change.
>
> Personally, I'd like to see every patch to OE being sent to and
> reviewed on the mailing list.
> About a pull based model, wouldn't we need something like the kernels'
> subsystem maintainers to share the load? Seeing that there already
> seems to be a serious manpower problem, who would have the time to do
> that?

One of the differences with the OE meta data is that its structure is
rather flat instead of a nice hierarchy like the kernel.  Another
problem is an update in one of the core components can often have
unforeseen consequences in other packages.  So I don't think there is
any substitute for a lot of testing.  A lot of the work to keep it all
going is simply busy-work -- updating URI's, adding new versions of
packages, etc, so I would hate to slow that down.  How about coming up
with a list of directories/files that need mail list review:

- classes
- conf/bitbake.conf
- conf/distro
- packages/images
- packages/tasks
- packages/linux/linux.inc
- packages/glibc/
....

Perhaps with everything else (machines, random packages), it would be
strongly advised that you get sign-off from the maintainer of that
recipe if listed.  This would help encourage the maintainers to stay
involved.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


