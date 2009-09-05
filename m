Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mjr5a-0000jJ-Tn
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 10:57:43 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.175])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mjqn6-0000FI-PY
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 09:38:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252105390-3800-1-git-send-email-raj.khem@gmail.com>
References: <1252105390-3800-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 05 Sep 2009 09:38:30 +0100
Message-Id: <1252139910.22587.317.camel@kc.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] perl_5.8.8.bb: Fix compilation when bindir is not /usr/bin
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
X-List-Received-Date: Sat, 05 Sep 2009 08:57:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-09-04 at 16:03 -0700, Khem Raj wrote:
> +	       -e 's,/usr/,${layout_exec_prefix}/,g' \

Why not ${prefix}?

p.




