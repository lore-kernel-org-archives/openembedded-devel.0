Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ol0jx-0007hR-H0
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 16:32:42 +0200
Received: by wwb34 with SMTP id 34so5453861wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=mAX+gRGa/b+3MqpAxnGGeO7RSVA+FSolYy8PwxrF4mc=;
	b=F6dc0tEHD2kXAZZfiLCzR/JlnHJtbc/xhd8KXh6c4n8wbqqmFi/O2IvjDzurOLFGKs
	bqEGPZ0UhUUpOmFNgtk9XC5oUubq1Fk/LDlV8RwFmgEGPsyVrsXv6aJY3dGMz8HE3oeK
	9VSgRcuHSgLMO+a8M9pX9mspPqprc1BxFh090=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=w2+qnE/RxJzC7ZFErgfkkcwqO0b9tT2Phvl5eDYSuyrJXXkT45OYPROLhcZ3TkQ6u0
	LWLMU9BEkVZYr0/cFSEIHl/QffShsIkskUU+05wvJzlID0tO33j6hffxI6vTyWF/18UB
	wiSvSZPSxogF0eNxg9k/HOej1vEVLBgNXAUKw=
Received: by 10.227.132.199 with SMTP id c7mr4539769wbt.89.1281969144172; Mon,
	16 Aug 2010 07:32:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Mon, 16 Aug 2010 07:32:04 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 16 Aug 2010 07:32:04 -0700
X-Google-Sender-Auth: 5GKD6TvyvjOsRNDP8qwfHKRv4Y0
Message-ID: <AANLkTim90Y+pBFcF6YmYnXOdTB94JbB1=JMN1vpqL2k8@mail.gmail.com>
To: bitbake-dev@lists.berlios.de, 
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [ANNOUNCE] BitBake 1.10.0
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
X-List-Received-Date: Mon, 16 Aug 2010 14:32:42 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

I've created a 1.10.0 release based upon the current 1.10 branch in BitBake.
 Unfortunately, it's nontrivial to list here everything that has been done
since 1.8, as master has been developed for years before stabilizing enough
to be released.  See
http://git.openembedded.org/cgit.cgi/bitbake/tree/ChangeLog?id=1.10.0 for an
idea of some of the bigger developments.  One of the biggest is the
frontend/backend split.  BitBake now has the ability to communicate between
frontend and backend via XML/RPC in both directions, rather than being in a
single process.  This means it will be much easier for things like the OE
eclipse plugin to gain the ability to control builds, by sending a bitbake
server commands and receiving events to display to the user.

Again, I apologize for how very brief this announcement is, in the future
we'll be doing a much better job at summarizing the changes in a release, as
the change list will be within the bounds of reason :)  You can obtain the
release archive at https://developer.berlios.de/projects/bitbake/ as always,
or you can of course utilize the 1.10.0 tag in the bitbake git repository.
 Thanks for your time, and we'd greatly appreciate folks testing this out.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

