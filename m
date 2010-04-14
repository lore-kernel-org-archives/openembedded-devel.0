Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1O2250-0003n7-7y
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 14:52:31 +0200
Received: from homiemail-a15.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 9ACA3179B25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 05:49:04 -0700 (PDT)
Received: from sspaeth.de (unknown [195.190.188.219])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPA id 3DAB276C065; 
	Wed, 14 Apr 2010 05:48:57 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Wed, 14 Apr 2010 14:48:52 +0200
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1271238939-7065-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Wed, 14 Apr 2010 14:48:52 +0200
Message-ID: <87hbne8aiz.fsf@SSpaeth.de>
User-Agent: notmuch version 0.1-107-g553feae (Emacs 23.1.1/x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 14 Apr 2010 12:52:31 -0000
Content-Type: text/plain; charset=us-ascii

On 2010-04-14, Enrico Scholz wrote:

> @@ -227,7 +238,9 @@ python packagestage_scenefunc () {
> -        os.system('rm -f ' + stamp + '.*')
> +	for fname in glob.glob(stamp + '.*'):
> +	    _package_unlink(fname)
> +

> @@ -260,8 +273,8 @@ python packagedstage_stampfixing_eventhandler() {
> -                        os.system('rm -f ' + dir)
> -                    os.system('rm -f ' + stamp)
> +			_package_unlink(dir)
> +		    _package_unlink(stamp)

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Given you have made sure that those changed indentations are actually
intended (I have not looked at the context of that patch):

Acked-by: Sebastian Spaeth <Sebastian@SSpaeth.de>


