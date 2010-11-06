Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PEh1V-0005uk-Cy
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 12:33:30 +0100
Received: by ewy2 with SMTP id 2so2124022ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=pFDNOjIp0XNxZMFZy2a+Pj8fsXVm+vorTiMsaI3aiiU=;
	b=pdOpfGs6GVPAq2CE/xfhD4otjPEj5cbE+lYpVdUnDIZdWZjrRW9QjIj7jIEG/OP5Yj
	G5pbv94DbgbDN+dQj/BygxrwPsXHyK9iE3zvvrvmf871bE0c5exeF7Fw8yJ5pDl03DEB
	bxlzqb57NuwAdnYwLKER2dAgND513eyp7D9cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=cszY3HTx/9fAHC+y/u6g8iVayfsQimpaiz/3y8hTbZi5Je+RRGaFHwhO23coVWUXkk
	BBmtqOH8WTthErmkiF8NnNkniqj+dh/3jHE443/gqCfhxf7Ey3GFspFl7KG8o3j2qVC+
	4eY84prionfmgpJ1rg0o68CYmfwDkU/Sih/r4=
Received: by 10.14.48.5 with SMTP id u5mr1749955eeb.25.1289043150533;
	Sat, 06 Nov 2010 04:32:30 -0700 (PDT)
Received: from localhost (c-e3dee555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.222.227])
	by mx.google.com with ESMTPS id q58sm2048450eeh.15.2010.11.06.04.32.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 04:32:29 -0700 (PDT)
Date: Sat, 6 Nov 2010 12:32:24 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106113224.GA1314@boggieman.bredbandsbolaget.se>
References: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
	<20101106081015.GN15069@ibawizard.net>
MIME-Version: 1.0
In-Reply-To: <20101106081015.GN15069@ibawizard.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ARMv4 not working with latest gcc,eglibc
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
X-List-Received-Date: Sat, 06 Nov 2010 11:33:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Nov 06, 2010 at 09:10:15AM +0100, Petr Štetiar wrote:
> Kristoffer Ericson <kristoffer.ericson@gmail.com> [2010-11-06 00:56:00]:
> 
> > Khems addition of gcc 4.5 patch effectivly removed the thumb 'bx'
> > instruction from the binaries, but Im getting the exact same issue as before
> > (kernel panic at init time).
> 
> Same issue as before? What does it mean? What machine and distro combination
> is that? I can build something and test it on my ts72xx, which is armv4t also.
> 

HP Jornada 720 with flashrom
Distro JLime-2010.1.conf
arch : Armv4

For the record, armv4 is not the same as armv4t, meaning you can for instance
run bx without any issue while I cannot. So saying that gcc 4.5 produces fine
binaries for your platform is not the same as that it should work on mine.

The issue Im seeing is directly after kernel hands over to sysinit I get 
a kernel panic "trying to kill init..". The following backtrace is nonspecific
and essentially says that it wasnt able to run the first binary (=init).

> > Filip zyzniewski had the combination of gcc 4.4.2 + eglibc 2.12 working well
> > on his machine, I also know another person with an ARMv4t which used gcc 4.5
> > + eglibc 2.12 without any issues (with same distro file).  Therefore I still
> > believe its an compiler/thumb issue.  Im currently trying to reproduce
> > filips environment to make sure, once I do it should be confirmed.
> 
> Sorry, I don't know Filip, nor his machine, can you be please more specific?
> :-) Thanks.
> 

He built the combo gcc 4.4.2 + eglibc 2.12 for same machine using same
distro file and his works, mine doesnt (i got gcc 4.5).

> -- ynezz
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


