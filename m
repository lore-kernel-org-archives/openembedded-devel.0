Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUs38-0006VB-UQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 04:01:49 +0200
Received: by iwn34 with SMTP id 34so3891817iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 18:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=v/ooiXujOq4ZVfuvYfrq6Mug31e5rb9/F0am1M5Dc2s=;
	b=ZUpWLD5GnLpsVFADInnOlZ82mnBYY2fhv047tEpFPSf1UvBe1OZLjermIHVsVcdMm+
	0rX0/1knYlGDZwlbyJzU9yKTyNO8Fc4LKUUPYUbTSvU3/+ckUxmqG5A2M7XYbQqieEtH
	HmbOOmnQOc4VO4mrg0cvcrGdAXm7cw8gK4Fnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=AzXkbB3g3HdzXaDWb+oAwiEQqnucpW+q5LjoJvGUCoilZTgG59fE2rsBjChpWuHniP
	yn3MbXy624t7uI3Ph43FvCFkqbnOzIbFYgsL5OqZKVM31oMSOSFpVjsCYHiekeXtFa/q
	GcoLzWIvNuBDb6d1Qy/+Ox5itr6kJvDL6p6R4=
Received: by 10.231.59.80 with SMTP id k16mr1638176ibh.114.1278122221611; Fri, 
	02 Jul 2010 18:57:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Fri, 2 Jul 2010 18:56:41 -0700 (PDT)
In-Reply-To: <4BB2E2A3-3F2C-428D-96DE-C21572DB6931@keylevel.com>
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com> 
	<AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com> 
	<411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
	<AANLkTimhN1fFCIyJK_G8WWGR903UqjtLZsXOzM6LRU4I@mail.gmail.com> 
	<4BB2E2A3-3F2C-428D-96DE-C21572DB6931@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Jul 2010 18:56:41 -0700
Message-ID: <AANLkTinVRH1sK-ZEOU3d4xSbbKGrzs_ycQPSmPoZkUh9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'Generic' x86 build
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
X-List-Received-Date: Sat, 03 Jul 2010 02:01:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 2, 2010 at 5:04 PM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> mount -t proc /proc /proc
> mount -t sysfs none /sys
>

I wonder if linuxrc applet in busybox has bug.
you could try a different version of busybox
to verify that.
-Khem


