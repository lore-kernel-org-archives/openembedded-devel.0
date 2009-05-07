Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M1ymy-0008KP-5x
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 10:17:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M1yh3-00045s-3F
	for openembedded-devel@openembedded.org; Thu, 07 May 2009 08:11:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 07 May 2009 08:11:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 07 May 2009 08:11:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 07 May 2009 10:10:55 +0200
Message-ID: <gtu527$coc$1@ger.gmane.org>
References: <1240929390-16041-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <1240929390-16041-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] recipes/unifdef/files/unifdef.c : more modern glibc expose getline from
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
X-List-Received-Date: Thu, 07 May 2009 08:17:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 28-04-09 16:36, Koen Kooi wrote:
> From: Graeme Gregory<dp@xora.org.uk>
>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/unifdef/files/unifdef.c |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/unifdef/files/unifdef.c b/recipes/unifdef/files/unifdef.c
> index 552025e..977e682 100644
> --- a/recipes/unifdef/files/unifdef.c
> +++ b/recipes/unifdef/files/unifdef.c
> @@ -206,7 +206,7 @@ static void             done(void);
>   static void             error(const char *);
>   static int              findsym(const char *);
>   static void             flushline(bool);
> -static Linetype         getline(void);
> +static Linetype         parseline(void);
>   static Linetype         ifeval(const char **);
>   static void             ignoreoff(void);
>   static void             ignoreon(void);
> @@ -512,7 +512,7 @@ process(void)
>
>   	for (;;) {
>   		linenum++;
> -		lineval = getline();
> +		lineval = parseline();
>   		trans_table[ifstate[depth]][lineval]();
>   		debug("process %s ->  %s depth %d",
>   		    linetype_name[lineval],
> @@ -526,7 +526,7 @@ process(void)
>    * help from skipcomment().
>    */
>   static Linetype
> -getline(void)
> +parseline(void)
>   {
>   	const char *cp;
>   	int cursym;




