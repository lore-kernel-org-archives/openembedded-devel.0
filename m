Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KFWmq-0001q2-0M
	for openembedded-devel@openembedded.org; Sun, 06 Jul 2008 18:08:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KFWj6-0004Ap-3U
	for openembedded-devel@openembedded.org; Sun, 06 Jul 2008 16:04:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 06 Jul 2008 16:04:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 06 Jul 2008 16:04:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 06 Jul 2008 18:04:26 +0200
Message-ID: <g4qqea$355$1@ger.gmane.org>
References: <4870DF7B.2050603@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008061003)
In-Reply-To: <4870DF7B.2050603@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: libtool issues with angstrom and classpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 06 Jul 2008 16:09:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> hi,
> koen already told me that there will be libtool problems when building
> classpath in angstrom 2008.1.
>
> what I get are the following error messages:
>
> i686-linux-libtool: link: unsupported hardcode properties
> i686-linux-libtool: link: See the libtool documentation for more
> information.
> i686-linux-libtool: link: Fatal configuration error.
>
> Caused by the following command:
>
> make[3]: Entering directory
> `/home/rob/oe/beagle/tmp/work/i686-linux/classpath-initial-0.93-r1/classpath-0.93/native/jni/java-net'
> /bin/sh ../../../i686-linux-libtool --tag=CC   --mode=link ccache gcc -W
> -Wall -Wmissing-declarations -Wwrite-strings -Wmissing-prototypes
> -Wno-long-long -Wstrict-prototypes -pedantic -Werror
> -isystem/home/rob/oe/beagle/tmp/staging/i686-linux/usr/include -Os
> -module -version-info 0:0:0 -no-undefined
> -L/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib
> -Wl,-rpath-link,/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib
> -Wl,-rpath,/home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o
> libjavanet.la -rpath
> /home/rob/oe/beagle/tmp/staging/i686-linux/usr/lib/classpath-initial
> javanet.lo java_net_VMInetAddress.lo java_net_VMNetworkInterface.lo
> java_net_VMURLConnection.lo gnu_java_net_VMPlainSocketImpl.lo
> gnu_java_net_local_LocalSocketImpl.lo
> ../../../native/jni/classpath/jcl.lo
> ../../../native/jni/native-lib/libclasspathnative.la -lmagic
>
> I debugged this problem to the point where I found out that it does not
> like the '-lmagic'. If I remove that from the makefile the build
> continues. However this cannot be the real fix.
>
> What is wrong here and how should I fix it?

I suspect that it doesn't like getting a lib directly (-lmagic), but 
want a .la file instead. I don't know a lot about libtool, so please 
speak up if this is nonsense :)

regards,

Koen



