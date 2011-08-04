Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QovKf-0004P6-2N
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 12:39:17 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 4 Aug 2011 12:34:53 +0200
X-TM-IMSS-Message-ID: <714a732200030eee@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 714a732200030eee ;
	Thu, 4 Aug 2011 12:33:48 +0200
Message-ID: <4E3A75CE.4040408@nedap.com>
Date: Thu, 04 Aug 2011 12:34:54 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4E3A6A8D.3010301@nedap.com>
	<201108041107.57156.paul.eggleton@linux.intel.com>
In-Reply-To: <201108041107.57156.paul.eggleton@linux.intel.com>
X-OriginalArrivalTime: 04 Aug 2011 10:34:53.0890 (UTC)
	FILETIME=[25BF5220:01CC5292]
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: exclude (r)depends
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
X-List-Received-Date: Thu, 04 Aug 2011 10:39:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 12:07 PM, Paul Eggleton wrote:
> On Thursday 04 August 2011 10:46:53 Jaap de Jong wrote:
>> I've build a simple recipe.
>> Bitbake figures it depends on libsqlite0 and libsqlite3-0; which is
>> correct by the way...
>> For some reason I don't want the dependencies in the ipk file.
>> Is there some flag for this?
> There's no "flag" for this because just taking away the shlibdeps-generated
> RDEPEND will almost certainly break the application/library at runtime. There
> are a few correct ways to solve it:
>
> 1) If the part of the binary output that needs sqlite is a plugin or otherwise
> optional module, just put it into a separate package (e.g. using
> PACKAGES_prepend = "${PN}-sqlitemodule" then FILES_${PN}-sqlitemodule =
> "${libdir}/libsomethingsqlite.so.*". Then your main package (${PN}) should not
> depend on sqlite anymore, as long as it doesn't have a hard dependency on the
> sqlite-using module.
> 2) Disable the sqlite dependency during configure, or if that can't be done,
> patch the source to acheive the same effect.
>
> 3) Depending on how complex the program is, with extra effort you could patch
> the source to turn it into an optional runtime dependency by using dlopen(3)
> instead of linking to sqlite during the build.
>
Probably the easiest way for me is to remove the specific *.so files 
after building.
Thanks for your support!

Jaap



