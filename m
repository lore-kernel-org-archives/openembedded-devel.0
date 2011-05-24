Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QOs9k-0008UJ-Kh
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 16:00:20 +0200
Received: by fxm19 with SMTP id 19so5307595fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2011 06:57:19 -0700 (PDT)
Received: by 10.223.43.145 with SMTP id w17mr3691495fae.12.1306245439209;
	Tue, 24 May 2011 06:57:19 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	by mx.google.com with ESMTPS id 14sm2750434fas.6.2011.05.24.06.57.15
	(version=SSLv3 cipher=OTHER); Tue, 24 May 2011 06:57:16 -0700 (PDT)
Message-ID: <4DDBB93A.3050209@dresearch-fe.de>
Date: Tue, 24 May 2011 15:57:14 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110414 SUSE/3.1.10 Thunderbird/3.1.10
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org, eric@eukrea.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] apr-util: disable odbc support to avoid QA error
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
X-List-Received-Date: Tue, 24 May 2011 14:00:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.05.2011 16:07, Steffen Sledz wrote:
> The odbc checker part of the configure script seems to be buggy and
> may add host pathes to compiler and linker options:
>
> --------->snip<--------
>   checking for odbc_config... /usr/bin/odbc_config
>     adding "-I/usr/include" to CPPFLAGS
>     adding "-L/usr/lib" to LDFLAGS
>     setting LIBS to "-L/usr/lib -lodbc"
> --------->snip<--------
>
> Signed-off-by: Steffen Sledz<sledz@dresearch-fe.de>

If there are no NAKs i'll push this commit tonight to enable the build on linux distros like openSUSE which fail at the moment.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


