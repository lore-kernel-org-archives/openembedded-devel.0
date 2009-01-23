Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LQVIt-0008VZ-As
	for openembedded-devel@openembedded.org; Sat, 24 Jan 2009 00:19:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LQVBl-00038Z-ME
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 23:11:49 +0000
Received: from 155.104.37.17 ([155.104.37.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 23:11:49 +0000
Received: from jeremy.williams by 155.104.37.17 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 23:11:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Jeremy Williams <jeremy.williams@ngc.com>
Date: Fri, 23 Jan 2009 23:11:39 +0000 (UTC)
Message-ID: <loom.20090123T230426-652@post.gmane.org>
References: <CF7FB0793253794F9F45991443E5FE2004DFC46711@us194mx002.tycoelectronics.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 155.104.37.17 (Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5)
Sender: news <news@ger.gmane.org>
Subject: Re: Package fetch error
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
X-List-Received-Date: Fri, 23 Jan 2009 23:19:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Charlton, John <john.charlton <at> tycoelectronics.com> writes:

> 
> I am trying to resolve a problem with bitbake package fetch.  I have a proxy
server and the proxydirect server
> works for bitbake up to the libXCursor-1.1.9.tar.bz2 fetch then it times out
after resolving the
> www.angstrom-distribution.org to the IP address 85.214.40.226:

There are two sites hosted at that IP:

>nslookup linux-to-go.org

Non-authoritative answer:
Name:    linux-to-go.org
Address:  85.214.40.226


>nslookup angstrom-distribution.org

Non-authoritative answer:
Name:    angstrom-distribution.org
Address:  85.214.40.226

If you to http://85.214.40.226 in your browser, the default site is
linux-to-go.org, which caused the failure when retrieving by IP.  This means
when retrieving via bitbake, for some reason the host headers are not being sent.

The fetch command for http:// is 
"/usr/bin/env wget -t 5 --passive-ftp -P {DEST_DIR} {url}"

If you issue this from the command line using the www.angstrom-distribution.org
url does it fail?

-jeremy






