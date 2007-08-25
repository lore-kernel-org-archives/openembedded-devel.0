Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1IOuFf-0005Rx-SM
	for openembedded-devel@openembedded.org; Sat, 25 Aug 2007 13:56:31 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1IOuEI-0001fE-2E
	for openembedded-devel@openembedded.org; Sat, 25 Aug 2007 13:55:02 +0200
Received: from fon38-2-82-237-108-87.fbx.proxad.net ([82.237.108.87])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 25 Aug 2007 13:55:02 +0200
Received: from clement.hermann by fon38-2-82-237-108-87.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Aug 2007 13:55:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: =?utf-8?b?Q2zDqW1lbnQ=?= Hermann =?utf-8?b?KG5vZGVucyk=?=
	<clement.hermann@free.fr>
Date: Sat, 25 Aug 2007 11:40:03 +0000 (UTC)
Message-ID: <loom.20070825T132824-492@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 82.237.108.87 (Mozilla/5.0 (X11; U; Linux i686 (x86_64); fr;
	rv:1.8.1.6) Gecko/20070723 Iceweasel/2.0.0.6 (Debian-2.0.0.6-1))
Sender: news <news@sea.gmane.org>
Subject: Re: OE website upgraded to drupal 5.2
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
X-List-Received-Date: Sat, 25 Aug 2007 11:56:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

> Hi,
>
> The oe website has been upgraded to drupal 5.2 (after a few failed attemps
> and restoring a
> week old backup) and all things seems to be running again.
>
> The only thing I couldn't fix is the sorting of posts on the frontpage, it
> needs to be
> sticky posts, new posts, old posts. Any drupal gurus with hints?
>
 
The wiki seems to have problems as well.
 
Displaying a page shows the following warnings :
 
 
    * warning: pg_query() [function.pg-query]: Query failed: ERROR: relation
"wiki_access" does not exist in /var/www/oe/includes/database.pgsql.inc on
line 125.
    * user warning: query: SELECT COUNT(*) FROM wiki_access WHERE (nid = 0 OR
nid = 77) AND ((gid = 0 AND realm = 'all')) AND grant_wiki_manage >= 1 in
/var/www/oe/includes/database.pgsql.inc on line 144.
    * warning: pg_query() [function.pg-query]: Query failed: ERROR: relation
"wiki_access" does not exist in /var/www/oe/includes/database.pgsql.inc on
line 125.
    * user warning: query: SELECT COUNT(*) FROM wiki_access WHERE (nid = 0 OR
nid = 77) AND ((gid = 0 AND realm = 'all')) AND grant_wiki_move >= 1 in
/var/www/oe/includes/database.pgsql.inc on line 144.
 
 
Also, editing is broken, and there is no "search" box in the top right : only
"array" is shown there.
 
Regarding the "wiki_access table" problem, if liquid if used as the wiki module,
the problem seems to lies in postgresql handling by liquid. I don't use
postgresql much so I don't know for sure, but according to comments on
http://drupal.org/node/117309 there is no postgresql install scripts. That could
explain the "no relation" error.
 
Cheers,
 
--
Clément Hermann (nodens)
                                                         



