Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1OijGy-0007Ev-Ms
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 09:29:21 +0200
Received: by ewy7 with SMTP id 7so3792421ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=TUghAG2tmrLuftnxdOBAokDgaZPSNfaMpHr+mbDv380=;
	b=XQf/3rGZazA+sTrb/KfYcN0M7V4UA+/8ZybZlOzzYyDjPr8fBPgwa01yv9qudhSDf5
	5XNmimWghQhI75PFg05CbkLPm7aKj7LysYm+cOmUPPovil5gogfqKPiKPBP1ygIF/d/4
	1dhOlssPDMHFioi95QErcSRQJUY+YUPHzjHTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=O5sRf/ql460jzdU8zdvK3sD3tTZD/SXldd3TuKl8Hjt0L22uqFnrYHd6OpPQWWDM0t
	S0C69wu1IhFqjoL5y1HPogqsMNzhv7UBjNDoKDEh9/GwwAqEnh7QHMXl8igJNuVlSOe+
	QgL8fa8rQhaF05GhUYE1rPiBy5IG0cTV9Jr80=
Received: by 10.213.31.194 with SMTP id z2mr300365ebc.82.1281425349471;
	Tue, 10 Aug 2010 00:29:09 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id u9sm9257025eeh.11.2010.08.10.00.29.08
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Aug 2010 00:29:08 -0700 (PDT)
Message-ID: <4C61009D.8050703@gmail.com>
Date: Tue, 10 Aug 2010 09:32:45 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100802 Lightning/1.0b2 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: SDK problems. GCC won't launch because it can't find libmpfr.so.4
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
X-List-Received-Date: Tue, 10 Aug 2010 07:29:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  I've compiled an SDK from a source tree in 
//data/src/lead-dev/openembedded/, and the resulting gcc compiler for 
arm has an RPATH of 
//data/src/lead-dev/openembedded/build/angstrom-dev/sysroots/i686-linux/usr/lib/, 
and will only run on my machine as long as that directory exists. If I 
remove that directory, it complains about libmpfr.so.4 not being found.

The previous SDK I built also had this odd RPATH, but gcc would run on 
other systems even if the RPATH-directory didn't exist.

I have placed the toolchain in a custom location and compile small 
applications with makefiles pointing to it. I tried unpacking to 
/usr/local/angstrom instead and ran the environment setup script, but 
got the same error.

- Tasslehoff

