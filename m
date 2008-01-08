Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JCIuZ-00049u-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 19:10:51 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id ECDF5628084
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2008 19:03:50 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200801081808.13174.zecke@selfish.org>
References: <47836C9B.3000407@gmx.net> <200801081527.09859.zecke@selfish.org>
	<1199804390.30486.28.camel@hammer.suse.cz>
	<200801081808.13174.zecke@selfish.org>
Date: Tue, 08 Jan 2008 19:03:50 +0100
Message-Id: <1199815430.2812.5.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Subject: Re: RFC: add osso version of libtool and libatk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 18:10:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:

> > I am not able to find any single change in the code.
> 
> I briefly talked with Robert on IRC. The requirement is not to use the osso 
> variant but the upstream version. For libtool this is 1.5.6 and for atk 
> probably the same applies.
> 
> My conclusion is there is nothing wrong with (re)adding the versions with a 
> DEFAULT_PREFERENCE="-1" and I asked him to proceed.

If I understand it correctly, it was really intended to only
re-libtoolize the package with the libtool version supporting maemo.

If it is true, calling libtoolize -f (or autoreconf -f -i) in the recipe
is a much cleaner solution.

It may be valid for more packages and more platforms.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



