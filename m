Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LplDV-0006ZP-Rn
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 17:22:18 +0200
Received: by yw-out-1718.google.com with SMTP id 9so784711ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=fsUFtbUPykQmWa15M3+ZifdriC8DjDG1Lfl0owAok4U=;
	b=qJo9jkwGh24k+R+nxXE9+EUb3HKerpkSX5hBOqIAehWIRvBjUxb1ZrhfAUlWT3YBss
	Se3fOZyCtP4fDP1bysOpm7nBO1rFDlXY5vLr1kJ46wuaa4Bjee07nvSn/bKYnSUOLdvN
	52id9f11+oss2WihsEhwgrZrBniZFGhsxGcrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=obKskppRevSSeE4ruD4hO/oFLgqLGVLVawDbLdyhcuHebp/3TfWEXUV7kpRk6AHuo1
	8EM8GhfJpfNFBaSGTmOfmsVGnuyBph3LLiEe/dtxoPHzlRFQ+R9sLQGSxDBgURzTyImk
	D7JY9rteYimkmT6z9HdTqejqsSUSr6Gd0SQkM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.15.20 with SMTP id s20mr2429523ybi.165.1238771969875; Fri, 
	03 Apr 2009 08:19:29 -0700 (PDT)
In-Reply-To: <200904030845.06338.hs4233@mail.mn-solutions.de>
References: <12386320381719-git-send-email-clarson@mvista.com>
	<200904030845.06338.hs4233@mail.mn-solutions.de>
Date: Fri, 3 Apr 2009 08:19:29 -0700
X-Google-Sender-Auth: 06771f0090c17fd3
Message-ID: <b6ebd0a50904030819h5aae9dfem810be6ba1821d4b0@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.155
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add COLLECTIONS 	mechanism w/ a sane default.
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
X-List-Received-Date: Fri, 03 Apr 2009 15:22:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 2, 2009 at 11:45 PM, Holger Schurig
<hs4233@mail.mn-solutions.de> wrote:
>> +# Take a list of directories in COLLECTIONS, in priority order (highest to
>> +# lowest), and use those to populate BBFILES, BBFILE_COLLECTIONS,
>> +# BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
>> +
>
> I like this idea, but I think that this *.inc file
> needs a larger comment block, e.g. not only stating
> what it does, but also why that would be handy. A
> typical use case or maybe a problem-solution section.
>
> I think when more of the *.inc and *.bbclass files get
> such in-file comments it'll be easier for people skimming
> throught the code to grasp the big picture.

Arguably, it could apply to everyone's use cases.  It's more
convenient to use than BBFILES even when you aren't relying on
bitbake's collections support to make it prefer the same recipe in one
collection over another, imo.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


