Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF426A428
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 15:05:31 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 57775F811FF; Tue, 28 May 2013 09:05:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9F8BCF811EC;
	Tue, 28 May 2013 09:05:31 -0600 (MDT)
Message-ID: <51A4C7C1.6050706@mlbassoc.com>
Date: Tue, 28 May 2013 09:05:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
	<1369604103-31315-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1369604103-31315-2-git-send-email-raj.khem@gmail.com>
Subject: Re: [meta-browser][PATCH 2/2] chromium: Add recipes for 29.0.1518
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2013 15:05:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-05-26 15:35, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Eric Bénard <eric@eukrea.com>
> CC: Denis Carikli <denis@eukrea.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
>
> ---
>   .../chromium-29.0.1518.2/armv6/include.gypi        |  8 ++
>   .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    | 15 ++++
>   .../chromium-29.0.1518.2/armv7a/include.gypi       |  9 +++
>   .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   | 15 ++++
>   .../chromium-29.0.1518.2/i586/include.gypi         |  5 ++
>   .../chromium-29.0.1518.2/i586/oe-defaults.gypi     | 15 ++++
>   .../uninitialised-warning.patch                    | 90 ++++++++++++++++++++++
>   .../chromium/chromium-29.0.1518.2/unistd-2.patch   | 27 +++++++
>   .../chromium-29.0.1518.2/x86-64/include.gypi       |  5 ++
>   .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   | 15 ++++
>   recipes-browser/chromium/chromium_29.0.1518.2.bb   | 72 +++++++++++++++++
>   11 files changed, 276 insertions(+)
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
>   create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
>   create mode 100644 recipes-browser/chromium/chromium_29.0.1518.2.bb
   ... snip

Have you tried this?  I just built it for my ARMv7a (i.MX6Q SabreLite) and it
seems to hang up on any page that uses JavaScript.  Try most any of the links
on the "Chrome Help" page.

Maybe I'm missing something?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

