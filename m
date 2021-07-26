Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.24932.1627264118912774853
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yvzj7p77;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264107; i=@fujitsu.com;
	bh=qoUWS6wdWPVuiaQWfy6YfqexPFOxUlE8T3YqcD5W9dk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yvzj7p77KzFqhrjUIQG2PC1WNRDjrrWEZutcIVhatAhbYE6OLZVqE65s4FZvSSgvX
	 jETkF2hZ8GdQYCd6jvkG/wN2Va7Xc3vO16iRIL8tO/8HEjMRTX2hIFTCJSqTg87Xtl
	 VxPJ5oaUdtmdAdnu+/k4tAROMyRkJd+JmbqqoGPR5Lr/X1gyMuwmdM3liZP4eN5jBZ
	 ucPWxP2riJjNgTe4X4osH7ycyC8jJ9kWj/9tV2kqy22hs19+NXkuSqKY2jTtN1t0dT
	 x0ABWYtr29yhX+DaThaRxmhvtZYC/LMogvuDFziwyvVJfJzA2XI6+92h+eEjf4UOmt
	 RU1Uw62kgckrg==
Received: from [100.112.198.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 76/1F-27654-A641EF06; Mon, 26 Jul 2021 01:48:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVTdL5F+
  CwdUHYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bp9e4FK1Ur9k9axt7AuFC2i5GLQ0hgNpPE
  24lv2CGcPYwSl1f1AzmcHGwCuhLnHq8Fs0UE9CWWzt7DDGILCwRIzG87C2azCKhKXDw+H8zmF
  XCXOHR0E5gtIaAgMeXhe6i4oMTJmU9YQGxmAQmJgy9eAMU5gGoUJWZPl4cor5B4ffgS8wRGnl
  lIOmYh6VjAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJC19DYQC+xSjdJL7VUtzy1uETXUC+
  xvFivuDI3OSdFLy+1ZBMjMIhSCo417WA8+fqD3iFGSQ4mJVHevrV/EoT4kvJTKjMSizPii0pz
  UosPMcpwcChJ8FoK/UsQEixKTU+tSMvMAQY0TFqCg0dJhDeCFyjNW1yQmFucmQ6ROsWoy7F57
  tJFzEIsefl5qVLivPnCQEUCIEUZpXlwI2DRdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK
  8byBSezLwSuE2vgI5gAjoiuP4vyBEliQgpqQamEkEvrfgu94cS65frHFd8mMrIPv/BrY97vR4
  xhj077tp4f6bEwhV/OTkWLzd8Jyn58MSaY0uW7LWSf9bXl/tIoGienvkTDq3IxQvkeI47zd5R
  ZG1QZ/DsYPv+gh25+XXXujnX3UpQzfg2sXlHQ9IdYZY/u79Veh5tSYktLtTVvnIt6cZueanaR
  bJOOjKy5jO+TX8g+CZD/cdRR7Eb/O2n4k6sT1Z53usRYC0tdOu24ZxNN6/lrlm0+efHOSXV92
  ufBbJMPZjx21+rSvFa7vR7ivVfjKqK79T/nV2i33ZrzaT33zZcn5JyP9uz+Mx/5hp7Xl3/vIT
  UrsWvU+7s+3o/6uS3wvdRl0RzHvVLrZJYpsRSnJFoqMVcVJwIALE9cicpAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-287.messagelabs.com!1627264106!384468!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11573 invoked from network); 26 Jul 2021 01:48:26 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:48:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1mPA6032344
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:48:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:48:24 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.20 -> 1.4.22
Date: Mon, 26 Jul 2021 18:48:19 +0800
Message-ID: <1627296499-3908-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

.. changelog::
    :version: 1.4.22
    :released: July 21, 2021

    .. change::
        :tags: bug, sql
        :tickets: 6786

        Fixed issue where use of the :paramref:`_sql.case.whens` parameter passing
        a dictionary positionally and not as a keyword argument would emit a 2.0
        deprecation warning, referring to the deprecation of passing a list
        positionally. The dictionary format of "whens", passed positionally, is
        still supported and was accidentally marked as deprecated.

    .. change::
        :tags: bug, orm
        :tickets: 6775

        Fixed issue in new :meth:`_schema.Table.table_valued` method where the
        resulting :class:`_sql.TableValuedColumn` construct would not respond
        correctly to alias adaptation as is used throughout the ORM, such as for
        eager loading, polymorphic loading, etc.

    .. change::
        :tags: bug, orm
        :tickets: 6769

        Fixed issue where usage of the :meth:`_result.Result.unique` method with an
        ORM result that included column expressions with unhashable types, such as
        ``JSON`` or ``ARRAY`` using non-tuples would silently fall back to using
        the ``id()`` function, rather than raising an error. This now raises an
        error when the :meth:`_result.Result.unique` method is used in a 2.0 style
        ORM query. Additionally, hashability is assumed to be True for result
        values of unknown type, such as often happens when using SQL functions of
        unknown return type; if values are truly not hashable then the ``hash()``
        itself will raise.

        For legacy ORM queries, since the legacy :class:`_orm.Query` object
        uniquifies in all cases, the old rules remain in place, which is to use
        ``id()`` for result values of unknown type as this legacy uniquing is
        mostly for the purpose of uniquing ORM entities and not column values.

 .. change::
        :tags: orm, bug
        :tickets: 6771

        Fixed an issue where clearing of mappers during things like test suite
        teardowns could cause a "dictionary changed size" warning during garbage
        collection, due to iteration of a weak-referencing dictionary. A ``list()``
        has been applied to prevent concurrent GC from affecting this operation.

    .. change::
        :tags: bug, sql
        :tickets: 6770

        Fixed issue where type-specific bound parameter handlers would not be
        called upon in the case of using the :meth:`_sql.Insert.values` method with
        the Python ``None`` value; in particular, this would be noticed when using
        the :class:`_types.JSON` datatype as well as related PostgreSQL specific
        types such as :class:`_postgresql.JSONB` which would fail to encode the
        Python ``None`` value into JSON null, however the issue was generalized to
        any bound parameter handler in conjunction with this specific method of
        :class:`_sql.Insert`.

    .. change::
        :tags: bug, engine
        :tickets: 6740

        Added some guards against ``KeyError`` in the event system to accommodate
        the case that the interpreter is shutting down at the same time
        :meth:`_engine.Engine.dispose` is being called, which would cause stack
        trace warnings.

    .. change::
        :tags: bug, orm, regression
        :tickets: 6793

        Fixed critical caching issue where the ORM's persistence feature using
        INSERT..RETURNING would cache an incorrect query when mixing the "bulk
        save" and standard "flush" forms of INSERT.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.20.bb => python3-sqlalchemy_1.4.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.20.bb => python3-sqlalchemy_1.4.22.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb
index b96cdd3ed8..feb509e3f4 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "38ee3a266afef2978e82824650457f70c5d74ec0cadec1b10fe5ed6f038eb5d0"
+SRC_URI[sha256sum] = "ec1be26cdccd60d180359a527d5980d959a26269a2c7b1b327a1eea0cab37ed8"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1

