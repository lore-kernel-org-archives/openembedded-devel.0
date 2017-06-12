Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id CA3E271AC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 06:20:11 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1dKIhp-0008Kw-8O for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jun 2017 08:20:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 12 Jun 2017 08:15:57 +0200
Message-ID: <ohlbin$5f6$1@blaine.gmane.org>
References: <1497213367-24044-1-git-send-email-maryan.pricak@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <1497213367-24044-1-git-send-email-maryan.pricak@gmail.com>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jun 2017 06:20:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 11-06-17 om 22:36 schreef Marian Pritsak:
> Hiredis is a C client library for Redis database.
> Hiredis does not use autotools, but plane Makefile instead,
> so few changes had to be made, including removing hard coded
> compiler, setting INSTALL to 'cp -r' to to avoid host user
> comtamination QA issue, and setting PREFIX to /usr instead of
> default /usr/local.
> 
> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>

[..[

> +# By default INSTALL variable in Makefile is equal to 'cp -a', which preserves
> +# ownership and causes host-user-contamination QA issue.
> +# And PREFIX defaults to /usr/local.
> +do_install_prepend() {
> +  export PREFIX=/usr
> +  export INSTALL='cp -r'
> +}

Don't hardcode '/usr', but use '${prefix}'



