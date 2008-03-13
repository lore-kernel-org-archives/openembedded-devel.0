Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JZe2i-000072-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 04:23:49 +0100
Received: by py-out-1112.google.com with SMTP id y77so3213211pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 20:21:37 -0700 (PDT)
Received: by 10.35.128.1 with SMTP id f1mr14460879pyn.48.1205378496046;
	Wed, 12 Mar 2008 20:21:36 -0700 (PDT)
Received: from ?10.39.211.14? ( [128.252.65.39])
	by mx.google.com with ESMTPS id n29sm32505980pyh.38.2008.03.12.20.21.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Mar 2008 20:21:34 -0700 (PDT)
Message-ID: <47D89DBE.8060508@gmail.com>
Date: Wed, 12 Mar 2008 22:21:34 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <pan.2008.03.11.19.54.14@gmail.com>
In-Reply-To: <pan.2008.03.11.19.54.14@gmail.com>
X-SA-Exim-Connect-IP: 64.233.166.178
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cellwriter
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
X-List-Received-Date: Thu, 13 Mar 2008 03:23:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2008 02:54 PM, Ken Bloom wrote:
> I'm very surprised that CellWriter isn't in OpenEmbedded yet. This is a 
> GPL handwriting recognition system that can be used on keyboardless 
> systems, for example the Nokia 770, for input. Please add this if you 
> can, and encourage distributions for keyboardless devices (e.g. Poky 
> Linux, and Mamona) to include it in their images.
> 
> $ cat org.openembedded.dev/packages/cellwriter/cellwriter_1.3.3.bb
> DESCRIPTION = "A grid-entry natural handwriting input panel. As you write 
> characters into the cells, your writing is instantly recognized at the 
> character level. When you press Enter on the panel, the input you entered 
> is sent to the currently focused application as if typed on the keyboard."
> SECTION = "x11/input"
> AUTHOR = "Michael Levin"
> LICENSE = "GNU General Public License"
> DEPENDS = "gtk+"
> 
> SRC_URI = "http://pub.risujin.org/cellwriter/cellwriter-1.3.3.tar.gz"
> EXTRA_OECONF = "--without-gnome"
> 
> inherit autotools

Thanks for the recipe. pushed in committed revision 
b7bf0016f42503605382df1fb30e05c67e45930a, with minor modification.

Please send the usability patch to this list or the bugtracker.

Regards
Gordon


