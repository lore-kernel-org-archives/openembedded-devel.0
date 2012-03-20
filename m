Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SA0AC-00017R-Ak
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 15:35:52 +0100
Received: by bkcjg15 with SMTP id jg15so97783bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 07:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=F7OP3acInm52SCNlTagShQosevXxuhUekm81od0+LjE=;
	b=WglHD0X8z8w6Rc/FLXru/KC4/L6GyGcFuuwwG8tquR6/7OXpcwrSjtFwFYrbpkXnYQ
	D/qfpQ33GVSESw9vQJdr+fZwmLOmMLln0c6XQ7pBtVXdJ8+PMEwwSmh+suubYixrysnq
	Kh02vZBB2jiisncs0Z+/1LJbaQxmkd0i9Tb5iVWYKvFX68e36sOcfH8QD7u11kjnLHka
	OiR8HvLN6xpnKCCtLsUas6Kga5quJA46YGleBSSJLV5OM6YXgDZ3hx8XcfG4W6+BNqav
	DB7mmMHKrDUAEUki234Z02XUvnG9w3OLL8zP6G0zq+fc/pcW0UupHE6lpdJi2zSOrrY9
	SWAQ==
Received: by 10.204.152.12 with SMTP id e12mr45369bkw.29.1332253618381;
	Tue, 20 Mar 2012 07:26:58 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id d4sm3565797bky.13.2012.03.20.07.26.57
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 07:26:57 -0700 (PDT)
Message-ID: <4F6893B1.20809@dresearch-fe.de>
Date: Tue, 20 Mar 2012 15:26:57 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
	<4F682E0C.4030101@dresearch-fe.de>
	<CAMKF1spMP1LHMM76RTbiOwkijgy5c0_9FfbUAc9V_xZ7VBEZgA@mail.gmail.com>
In-Reply-To: <CAMKF1spMP1LHMM76RTbiOwkijgy5c0_9FfbUAc9V_xZ7VBEZgA@mail.gmail.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQloba5tNu5maKDJGW7kc84ySriJmRGQfTdpQJa7rCeRsrzLoGgF5ZXhYClfZe5zus0Iio/z
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Tue, 20 Mar 2012 14:35:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2012 15:16, Khem Raj wrote:
> On Tue, Mar 20, 2012 at 12:13 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>
>> Khem has put the tarball on the mirror. But this does not fix our problem.
>>
>> Fetching from the original url downloads an XHTML error page and stores it under the name of the archive. This of course results in a checksum mismatch. :(
> 
> I might have put a wrong one. I redid it please try again after
> deleting it from your DL_DIR

I retried. but as i expected with success again.

I believe it is a problem by design. The fetcher first tries the original location which did not fail but returns the mentioned error file.

-----------------------> snip <------------------------

NOTE: package libmatthew-0.7.1-r0: task do_fetch: Started
asking libproxy about url 'http://www.matthew.ath.cx/projects/java/libmatthew-java-0.7.1.tar.gz'
 libproxy suggest to use 'direct://'
 --2012-03-20 15:22:20--  http://www.matthew.ath.cx/projects/java/libmatthew-java-0.7.1.tar.gz
 Resolving www.matthew.ath.cx (www.matthew.ath.cx)... 81.187.131.226, 2001:8b0:1b1::4
 Connecting to www.matthew.ath.cx (www.matthew.ath.cx)|81.187.131.226|:80... connected.
 HTTP request sent, awaiting response... 302 Found
 Location: http://www.matthew.ath.cx/errors/404 [following]
 asking libproxy about url 'http://www.matthew.ath.cx/errors/404'
 libproxy suggest to use 'direct://'
 --2012-03-20 15:22:20--  http://www.matthew.ath.cx/errors/404
 Reusing existing connection to www.matthew.ath.cx:80.
 HTTP request sent, awaiting response... 200 OK
 Length: 9228 (9.0K) [text/html]
 Saving to: `/home/sledz/sources/libmatthew-java-0.7.1.tar.gz'

      0K .........                                             100% 38.9K=0.2s

 2012-03-20 15:22:21 (38.9 KB/s) - `/home/sledz/sources/libmatthew-java-0.7.1.tar.gz' saved [9228/9228]

ERROR: The checksums for "/home/sledz/sources/libmatthew-java-0.7.1.tar.gz" did not match.
  MD5: expected "6a4db221129f230c64a0f937d00bb703", got "8f4fe8e82bb68a092434e7bb46e0214f"
  SHA256: expected "003c44be21859d1495c0571e249ce17edd5ac58636f67b6a8bc4f395a6c7e6a2", got "5a318486f7ee1ee4e0c2f66f1cd59decbc54753fc94b01a80711ac7ff79ec15a"

NOTE: package libmatthew-0.7.1-r0: task Fetch failed: http://www.matthew.ath.cx/projects/java/libmatthew-java-0.7.1.tar.gz checksum mismatch.: Failed
ERROR: Function 'Fetch failed: http://www.matthew.ath.cx/projects/java/libmatthew-java-0.7.1.tar.gz checksum mismatch.' failed
ERROR: Task 0 (/home/sledz/work/openembedded/recipes/libmatthew/libmatthew_0.7.1.bb, do_fetch) failed with exit code '1'
ERROR: '/home/sledz/work/openembedded/recipes/libmatthew/libmatthew_0.7.1.bb' failed

...
sledz@fensuse:/pm/sledz/HydraIP/OE> file /home/sledz/sources/libmatthew-java-0.7.1.tar.gz
/home/sledz/sources/libmatthew-java-0.7.1.tar.gz: XML document text

-----------------------> snip <------------------------

>> So in my opinion changing the recipe to the fedoraproject url seems to be the best way.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


