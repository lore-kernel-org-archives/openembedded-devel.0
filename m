Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OrJXb-0005WC-Mc
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 01:50:33 +0200
Received: by wwb31 with SMTP id 31so1413768wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 16:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=qaj7qXrdt8cPqFp8JbpmEgaY2GUvI+mcl2PofpG45Nw=;
	b=mjKxhuLArlMhqUHdOZ8/nFKgVtrVacT24UJvUwX1zYmDL2Mf+7dvucXYn1SVwRZSuq
	touv0Q0V2hnc3dBHV8QFIrRcw3qavPZdTUGcH6I4kYosjkPpTPA7CWsZSIuY1Ve27SVR
	V6Nd4bXQhEjoaaCvXSjd6C54mWPFb7qQ1Ua9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jF4aOkTj3/0kbabq8E8IbOrPevGX6nuMjqZtlRSD4uhJE8y6iuVRBgmQed84uZSIPe
	c4UDm4kh5kqosJnxZIUhSiE3qQDsscAMUNIj/xhlyJ+P4amWL7Qga1f4OVmHrBUQJY0U
	oo9mgrrt4v3ocW9y/Tr42olwK2/ny1/PjI4eo=
MIME-Version: 1.0
Received: by 10.227.138.76 with SMTP id z12mr321469wbt.60.1283471358473; Thu,
	02 Sep 2010 16:49:18 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Thu, 2 Sep 2010 16:49:18 -0700 (PDT)
In-Reply-To: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
References: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
Date: Thu, 2 Sep 2010 19:49:18 -0400
Message-ID: <AANLkTi=dre2x7eE=Djv0TiA4pCCpi-ACndBhv-TjCmNA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git issues
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
X-List-Received-Date: Thu, 02 Sep 2010 23:50:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 2, 2010 at 8:59 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> For some reason recently every once in a while on a git pull or git
> clone I get an error like this:
>
> git clone git://git.openembedded.net/openembedded openembedded
> Initialized empty Git repository in
> /home/frans/workspace/Linux/openembedded-test/openembedded/.git/
> fatal: The remote end hung up unexpectedly
> make: *** [all] Error 128
>
> Repeating the command often makes it work.
>
> Also I notice that the transfer rate is about 100-120 KB/s
> I seem to recall Leon also reported something like this with irc.
>
> Is this something others see as well?
> Especially the hangup does not really help to set up an automated test system.

Yeah, I know that is an issues for test systems.  It happened with our
last git server as well in Germany, so I'm not sure what causes it
yet.

Cliff

-- 
=================
http://bec-systems.com


