Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NvvnA-0007Yq-Qz
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 18:56:53 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1868442qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=8blBklrlpvb/XOdLSaqJ4GCf4Bo33x34mIREPpl0VCU=;
	b=nd7GB3fkDXuOGqVFUpM5ZaKCZW+O8c8jv/PChEYAYzdFKcRN6dFKJB1o/UcVDrRHvv
	vWmNGKZfCIPrQ4AFD1oGPsobtwDYMIiGVze4Oy8Nq4KYu5uEWNO2P53dQe0sxNHD+cEv
	mc4UPM/Wjjq85iNQAh/CZr+vWPZTpjbVZF2QE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=W7NZ+R/CMG5egm03UYdDNgzmrkPlC6LYbRFKEcS6wAR1R10ivWK8VoszdvkSwUSBLF
	zdsIxoOR3mzsLqWtTMypeBBqfU0f7MWgwqznwDlxBEL9AUhOU6r/EKETmon6M1WAMpp7
	jksKdqhv7eD53Apz9Wr70WRlD2iIqnZikoYrU=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.190.207 with HTTP; Sun, 28 Mar 2010 09:53:21 -0700 (PDT)
In-Reply-To: <1269794684-1331-2-git-send-email-GNUtoo@no-log.org>
References: <1269794684-1331-1-git-send-email-GNUtoo@no-log.org> 
	<1269794684-1331-2-git-send-email-GNUtoo@no-log.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 28 Mar 2010 09:53:21 -0700
X-Google-Sender-Auth: 8a85cbf3f29cc939
Received: by 10.229.35.80 with SMTP id o16mr1093866qcd.93.1269795221155; Sun, 
	28 Mar 2010 09:53:41 -0700 (PDT)
Message-ID: <b6ebd0a51003280953gef70279i86b2ba504a4ea6ea@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] DO_NOT_COMMIT_YET: fastjar: handle cross-compilation
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
X-List-Received-Date: Sun, 28 Mar 2010 16:56:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 28, 2010 at 9:44 AM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org>wrote:

>
>  btoc(m4 macro)'s AC_TRY_RUN didn't handle the cross-compilation case.
>  thanks ? for telling me that the third argument
>  was for cross-compilation.



Using the third argument for this sort of thing is not ideal.. in fact, I've
experimented with patching the autoconf macros to disable it.  The only time
you should consider using it is when the test is only for a sanity check,
and its result does not affect behavior.  When the result does affect
behavior and clearly isn't a sanity check, setting an assumed default
knowing nothing about the target environment is not the way to go.  You
should use the CONFIG_SITE / site files to feed in the test result as
appropriate for the platform, coupled with wrapping the AC_TRY_RUN call in
AC_CACHE_CHECK, to ensure it obeys it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

