Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4B894727E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:26:04 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so13517191pac.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zs5o62jSV8pUieEt8ha0xoSSXYVVggyOJ3bwxbuJJSE=;
	b=eg7cl96L0iXkzyFGGlFD+RN6w9g4SG8O3OeqqBj1CvVjd7bLdlKAG/ZZxI9uNAskdg
	oojAxiZrRbbw4Zw8PeUS9RUmhGzD9zinh5qQhXUSEEZThtYJR+eoZ95Dqxte1QPPDhJv
	ml2laZMbaBrfGhSsBR1eSjTQs7/N6RjGyR8drFJmMZZvZIlyUvnbAOjtlx4nG7v3X0ED
	SQMZ3AhstI7lIbO/XKqZjq+dSlth4BaxUU5Cy0M4MRwG7n4C5M5uotkROMhqnUz0MJ3V
	9HVXvsc6bozaLnwD8kC3m3lUf/AFSb5gw8ItlPUYE8HHOMrpfdLMHre48wJqCt70X1op
	q3eg==
X-Received: by 10.66.141.138 with SMTP id ro10mr64275858pab.67.1419621965788; 
	Fri, 26 Dec 2014 11:26:05 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:45d3:7811:c39e:509c?
	([2601:c:a700:272f:45d3:7811:c39e:509c])
	by mx.google.com with ESMTPSA id
	nk6sm28864601pdb.89.2014.12.26.11.26.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Dec 2014 11:26:04 -0800 (PST)
Message-ID: <549DB64A.5060904@gmail.com>
Date: Fri, 26 Dec 2014 11:26:02 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 01/12] nbench-byte: Fix license QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:26:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Otavio,
Thanks.

I just saw this this morning.

- armin

On 12/26/2014 11:21 AM, Otavio Salvador wrote:
> The license is not a common only and seems to be a 'free distribution'
> license but without explicit rules about modification or similar. Due
> that, we copied the license text from the README file and added it
> onto nbench-byte license file.
>
> This fixes following QA error:
>
> ,----
> | WARNING: Recipe nbench-byte, LICENSE (freely distributable) has
> |     invalid format, LICENSES must have operator "([&|() ])" between
> | 	them.
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta-oe/licenses/nbench-byte                               | 10 ++++++++++
>   meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb |  2 +-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/licenses/nbench-byte
>
> diff --git a/meta-oe/licenses/nbench-byte b/meta-oe/licenses/nbench-byte
> new file mode 100644
> index 0000000..7e47ba6
> --- /dev/null
> +++ b/meta-oe/licenses/nbench-byte
> @@ -0,0 +1,10 @@
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
> +IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
> +OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
> +IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> +NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> +DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> +THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> +(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
> +THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> index a98d507..2eedd7e 100644
> --- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
>   designed to expose the capabilities of a system's CPU, FPU, \
>   and memory system."
>   HOMEPAGE = "http://www.tux.org/~mayer/linux/"
> -LICENSE = "freely distributable"
> +LICENSE = "nbench-byte"
>   LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
>   SECTION = "console/utils"
>
>

