Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <yajinzhou@vm-kernel.org>) id 1LgqSc-0004cm-1K
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 02:08:46 +0100
Received: by rv-out-0708.google.com with SMTP id b17so1878906rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 18:03:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.185.13 with SMTP id i13mr2806638wff.36.1236647025913; Mon, 
	09 Mar 2009 18:03:45 -0700 (PDT)
In-Reply-To: <1236602555.8807.6.camel@port4>
References: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
	<1236602555.8807.6.camel@port4>
Date: Tue, 10 Mar 2009 09:03:45 +0800
Message-ID: <180e2c240903091803w6fd8a472sf67997340cb54422@mail.gmail.com>
From: yajin zhou <yajinzhou@vm-kernel.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: QA Issue: sanity test failed issue
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
X-List-Received-Date: Tue, 10 Mar 2009 01:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks very much.
I check the do_stage log of ncurses and find the problem is caused by the
'/' in TMPDIR. It will confuse the sed. So one tip of using OE: do NOT add
'/' to your TMPDIR.

+ sed -e 's/^installed=yes$/installed=no/' -e
'/^dependency_libs=/s,/home/yajin/OE/angstrom-stable//work/mipsel-angstrom-linux/ncurses-5.4-r17[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/home/yajin/OE/angstrom-stable//staging/mipsel-angstrom-linux/usr/lib/\1,g'
-e
'/^dependency_libs=/s,\([[:space:]'\'']\)/usr/lib,\1/home/yajin/OE/angstrom-stable//staging/mipsel-angstrom-linux/usr/lib,g'
-i
/home/yajin/OE/angstrom-stable//work/mipsel-angstrom-linux/ncurses-5.4-r17/temp-staging//usr/lib/./
libncurses.la



On Mon, Mar 9, 2009 at 8:42 PM, GNUtoo <GNUtoo@no-log.org> wrote:

> I had it once:
> The cause was that the TMPDIR that wasn't setup correctly:
> I had:
> TMPDIR = ${HOME}/oetmp/
> instead of:
> TMPDIR = ${HOME}/oetmp
>
> the last / caused the path of something into the TMPDIR to be:
> ${HOME}/oetmp//work/etc...
> the doubble slash prevented a regular expression from working.
> The regular expression in question was changing the content of the .la
> files(libtool archive).
> And so the .la content were not changed.
> And that triggered the QA problem because the paths inside the .la files
> weren't changed(they were relative to the build directory instead of
> the / path if I remember well)
>
> Denis.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
yajin

http://vm-kernel.org

