Received: from [64.233.178.247] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Knesy-00012V-QW
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 21:39:52 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1369817hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 12:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ylQ+BomHmX9QMKK+4utzG2fl7D4D23vhNnaQdGuWjf0=;
	b=d6JykDqZzDLAAhEtxW2jQ5OpQzvrWnoyQ9XFW49s9MymNtEPL+skhOh0kZVcQxIDHc
	9GxF/vExGT95+seMKF/+ciEfpA6zADcIsu0adUH+huw7P2eZDT7a9hFMyn1pwL+Qiiqt
	VmMePtFhDwkN0iBDz2euHSVeGZHueOA5j9Cx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=U2gR3Df/tmJLLnMOIa760ggst7ZvWiLrGZfvMWd23ZJj4QEafGRcLKNy7n3fr0+o0S
	A0CwsnStwWQlkWsp2TT5Fth2lSnYI+VCzQWE2I8HO0PXLTIjYfVlfv87WvDV7ZyusbdJ
	xQZkK3XDo/tfd651JBNvK3LHKY2ihkMjvdrOA=
Received: by 10.231.30.74 with SMTP id t10mr124189ibc.36.1223494512571;
	Wed, 08 Oct 2008 12:35:12 -0700 (PDT)
Received: by 10.150.212.20 with HTTP; Wed, 8 Oct 2008 12:34:42 -0700 (PDT)
Message-ID: <48239d390810081234t2b5ea5c4g5fcb6f1900a274da@mail.gmail.com>
Date: Wed, 8 Oct 2008 23:34:42 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: "Stanislav Brabec" <utx@penguin.cz>
In-Reply-To: <1223480224.9336.12.camel@hammer.suse.cz>
MIME-Version: 1.0
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
	<1223480224.9336.12.camel@hammer.suse.cz>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 19:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 8, 2008 at 7:37 PM, Stanislav Brabec <utx@penguin.cz> wrote:
> Sergey Lapin wrote:
> If you have a problem with VFAT and similar file systems, than you need
> an appropriate kernel fs/nls module and then edit /etc/fstab and/or
> /etc/udev/scripts/mount.sh.
Thanks, all this is already done.

>
> For historical reasons, HTTP characters are converted to 7 bits.
> If you see something like "%C5%BE%C5%99%C5%A1" after using wget, then it
> is not a bug, it is a feature.
No, it tries to convert, but fails.
So, as I see a problem is in wget itself.
using bash as shell, I can create directories fnd files with whatever
names I like,
so it seems this stuff is not locale-related.

Thanks a lot,
S.


