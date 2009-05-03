Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M0f4F-0005sM-GL
	for openembedded-devel@openembedded.org; Sun, 03 May 2009 19:01:31 +0200
Received: (qmail 19551 invoked from network); 3 May 2009 16:55:49 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 May 2009 09:55:49 -0700
Date: Sun, 3 May 2009 09:55:49 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090503165548.GB7973@smtp.west.cox.net>
References: <1241357669.13222.0.camel@daniel-laptop>
MIME-Version: 1.0
In-Reply-To: <1241357669.13222.0.camel@daniel-laptop>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: qemu-native build fail
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
X-List-Received-Date: Sun, 03 May 2009 17:01:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 03, 2009 at 09:34:29PM +0800, Daniel.Li wrote:
> Dear List,
> 
> I have found that qemu-native failed with gcc 3.4, see below.
> Originally, qemu failed with 4.* gcc, now qemu is ok with gcc3.4 but
> qemu-native failed. 
> 
> I googled, only found this http://pastebin.com/f75407ece# , which seems
> failed on 20 Apr.

This sounds like a host-provided gcc-3.4, which isn't new enough, is
being used, rather than the 3.4.6 that OE builds.  I thought this had
been fixed, but perhaps not.  Can you confirm that you have a gcc-3.4
package installed on your host?  Thanks.

-- 
Tom Rini


