Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MkN3e-00061S-QF
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 21:05:51 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MkMl4-0001SJ-C4
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 19:46:38 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252259364.4021.12.camel@utx.utx.cz>
References: <1252239576.4136.10.camel@utx.utx.cz>
	<1252240297.4490.158.camel@lenovo.internal.reciva.com>
	<1252240430.4490.160.camel@lenovo.internal.reciva.com>
	<1252259364.4021.12.camel@utx.utx.cz>
Date: Sun, 06 Sep 2009 19:46:36 +0100
Message-Id: <1252262796.4490.180.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
Subject: Re: very obscure race: access to a just-populated binary
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
X-List-Received-Date: Sun, 06 Sep 2009 19:05:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-06 at 19:49 +0200, Stanislav Brabec wrote:
> i did not know it. recipes/jpeg/jasper_1.900.1.bb and other recipes
> contain DEPENDS = "unzip-native", and it does not work.

Try:

do_unpack[depends] += "unzip-native:do_populate_staging"

p.




