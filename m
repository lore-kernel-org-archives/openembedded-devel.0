Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LfW2V-0005do-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 10:08:19 +0100
Received: from 88-109-164-210.dynamic.dsl.as9105.com ([88.109.164.210]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LfVyB-0006Op-KA
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 09:03:51 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
References: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
	<gop5fu$ec$1@ger.gmane.org>
	<ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
Date: Fri, 06 Mar 2009 09:03:50 +0000
Message-Id: <1236330230.4607.54.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: need help: cdrkit & bitifields
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
X-List-Received-Date: Fri, 06 Mar 2009 09:08:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-03-05 at 22:10 +0100, Frans Meulenbroeks wrote:
> main(int argc, char **argv)
> {
>     char c = 0xf0;
>     bitfields *bf = &c;

This isn't a legal thing to do.  Struct addresses on ARM need to be
32-bit aligned, whereas &c is only guaranteed aligned to an 8-bit
boundary.  You can't, in general, take a pointer to an arbitrary type,
cast it to a struct and expect to get good results.

You need to use a union, or something like:

struct wrapped_char {
	char c;
}

struct wrapped_char wc;
wc.c = 0xf0;
bitfields &bf = &wc;

p.




