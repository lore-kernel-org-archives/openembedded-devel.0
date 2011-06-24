Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QaEAN-000507-PB
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 23:43:55 +0200
Received: by iym10 with SMTP id 10so2937479iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 14:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=w0mdGOnDSfRt1VvqRCWTAlAq0ERrwtCWUf3ZqUJK7zk=;
	b=swAYF2Q+4A3fxAiDMCbiL5YTCVPeUddQuTEYzubUhv2Vrm0VRLo27VfI33EPQ6yDOm
	z//On79Rzkd8lqJ+SGELRjEpJov5746hm7SCG5/7y7Pvdoe60BEdosCeac0ERLJZiCbF
	0DlqlR2hYWVd5PAbfL+pqKcEraKCNttTiEKuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZSbCaFTurwg+FzlWTm/FxiW/2RiYyLcBTpoHnYJ5xk1RLrCbmAyaGJgHEUsRvS83ug
	/ODhlRcL8cOadDtrPSNICe30ORRwPkVqQ4rNRVmkDgzG0FuFNWpBJcH5GIeO+lrs00mS
	As1h/SUJpuR5ZEBgEhds9awXbVqXtiFw9dQa8=
MIME-Version: 1.0
Received: by 10.231.111.39 with SMTP id q39mr3063364ibp.106.1308951618083;
	Fri, 24 Jun 2011 14:40:18 -0700 (PDT)
Received: by 10.231.174.133 with HTTP; Fri, 24 Jun 2011 14:40:18 -0700 (PDT)
In-Reply-To: <BANLkTikPPYWL_-4qv+584CHgzt1DCzFeog@mail.gmail.com>
References: <BANLkTikPPYWL_-4qv+584CHgzt1DCzFeog@mail.gmail.com>
Date: Fri, 24 Jun 2011 16:40:18 -0500
Message-ID: <BANLkTi=_HKbs2iXrsBUDaX-1VfbzbiSqDQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Packaging from devshell
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
X-List-Received-Date: Fri, 24 Jun 2011 21:43:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I use devshell for compiling by running a bitbake generated do_compile shell
script in work/ for my package, this helps me develop faster as I can skip
over parsing and other repetitive stages.

However I'm not able to do the same with do_package_write, as the shell
script for the same appears to have an  empty function:

do_package_write() {
        :
}

Could anyone suggest which script  should I execute to package from
devshell?

Thanks,
Joel.

