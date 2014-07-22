Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 2CD6C705E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:59:56 +0000 (UTC)
Received: (qmail 11028 invoked by uid 1003); 22 Jul 2014 13:59:56 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.49.245)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Jul 2014 13:59:56 -0000
Message-ID: <53CE6E5B.7080209@balister.org>
Date: Tue, 22 Jul 2014 09:59:55 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH 1/2] zeroc-ice: blacklist, because it's not compatible with default db-6* version
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
X-List-Received-Date: Tue, 22 Jul 2014 13:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

How many recipes have issues with db6? Is there some standard guidance
on fixing these issues?

I am on vacation for 2.5 weeks, when I get back I'll look into this.

Philip

On 07/21/2014 06:29 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> index 79d8b5a..e39aa18 100644
> --- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> +++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
> @@ -10,6 +10,16 @@ SRC_URI = "http://www.zeroc.com/download/Ice/3.5/Ice-${PV}.tar.gz \
>  SRC_URI[md5sum] = "f00c59983cc904bca977133c0a9b3e80"
>  SRC_URI[sha256sum] = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b70493af392"
>  
> +#| MapDb.cpp: In constructor 'Freeze::MapDb::MapDb(const ConnectionIPtr&, const string&, const string&, const string&, const KeyCompareBasePtr&, const std::vector<IceUtil::Handle<Freeze::MapIndexBase> >&, bool)':
> +#| MapDb.cpp:138:46: error: call of overloaded 'set_bt_compare(int (*)(DB*, const DBT*, const DBT*))' is ambiguous
> +#| MapDb.cpp:138:46: note: candidates are:
> +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note: virtual int Db::set_bt_compare(bt_compare_fcn_type) <near match>
> +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'bt_compare_fcn_type {aka int (*)(__db*, const __db_dbt*, const __db_dbt*, long unsigned int*)}'
> +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*, const Dbt*, const Dbt*, size_t*)) <near match>
> +#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka int (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
> +#| make[3]: *** [MapDb.o] Error 1
> +PNBLACKLIST[zeroc-ice] = "BROKEN: not compatible with default db version"
> +
>  S = "${WORKDIR}/Ice-${PV}"
>  
>  inherit python-dir pkgconfig
> 

