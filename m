Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Mv5bQ-00040N-KE
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 10:41:03 +0200
Received: from [85.210.191.75] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Mv5af-0007jG-SP
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 09:40:14 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Tue, 06 Oct 2009 09:40:12 +0100
Message-Id: <1254818412.9214.107.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.191.75
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] java.bbclass: Use force (-f) for ln (suggested by Marcin).
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
X-List-Received-Date: Tue, 06 Oct 2009 08:41:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-10-05 at 23:08 +0200, Marcin Juszkiewicz wrote:
> @@ -72,7 +72,7 @@ oe_jarinstall() {
>        oewarn "file was in the way. removing:" $dir/$1
>        rm $dir/$1
>      fi
> -    ln -s $destname $dir/$1
> +    ln -sf $destname $dir/$1
>      shift
>    done
>  }

What's the reason for the -f argument?  If the target file already
exists then it seems like that "rm" should already take care of it.

p.




