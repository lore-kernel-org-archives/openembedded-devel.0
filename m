Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3929.1625124483075498977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 00:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=dwxQQXHz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625124480; i=@fujitsu.com;
	bh=LfYTYGg/LdNOqGQ34bkJoM7I8qxrKIE4Vzl+D1xWaNo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=dwxQQXHzUJwnPtbxN9km3GSBXnBgPMEmB1oAcZsL9o/u90kWVTvgwZILjW0F5jUUL
	 jiFTfTla74j11Iq7gW3q4YfyICceTKylVVAzKzitUUkV65M9PtQD63NWXDqolZQAbV
	 62rSxF8Pf8P6RKdXCEPD1oOExlnXVL5dx+c+D5I2fkfXB+NgdCnfbrTcawEgr1ltFy
	 3pdWgCqqjm6PT0R3fmnh8qah9drYkjATLg4nnwjiieeP37NjD2OUwtK56NS6NSRb7w
	 ousAVvu1iQDUdNtTbFiqqM2ADI2aLSKbr3NTZDUw+ypORkUuw8H7WvKTy/hMfyzOSK
	 66kZo1Oi5khvg==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 4B/31-03281-F7E6DD06; Thu, 01 Jul 2021 07:27:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqlufdzf
  B4MUqaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNt/1q2gjaTis87zRoY12l0MXJxCAnMYpJY
  s2cCC4Szm1Hiz8+jjF2MnBxsAroS5x6vZQexRQT0JZbO3sMMYgsLBEg8P3UKzGYRUJHY+O0QK
  4jNK+Ah8frCVrB6CQEFiSkP3zNDxAUlTs58wgJiMwuoSnQfecoEYctLNG+dDVTDAVSvKDF7uj
  xEa4XEjBnb2CYw8s5C0j0LSfcsJN0LGJlXMVomFWWmZ5TkJmbm6BoaGOgaGhrrmusaGhnqJVb
  pJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAsMupZC9cgfj2jcf9A4xSnIwKYnyvou6
  myDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgjcxFygnWJSanlqRlpkDjAGYtAQHj5II70yQNG9xQ
  WJucWY6ROoUo6KUOK86SEIAJJFRmgfXBou7S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEea
  /nAE3hycwrgZv+CmgxE9DiRU9ugiwuSURISTUwaX3IXsf9a6+qgblly75bLKfrH82p3b0nPfD
  pxdPXru+0k38RFdO9a6uF4YJZxesrWP7cydtr+fud9duFbFnuMk0l/swNX5zes4jNO3OXye3M
  4br57J95VmvWML07uXYd1+wSX6uk51ccoj/M81/hNGHHvj2ep57eme8nvCKA2WqpZJoEE/s11
  euJxRsqvz/xeK3zSsIv863qDXs912cB9zR9j3Z0PVvBmPjPq8WL7bnDrNr1lr9MAm9F338j+W
  Dv3/gpJ9XUzyY7HZU/nb5et/JLZpW50P43eUJ7/2cFx03+szp6+oHH0b/ytxySOfnxeuKWVcY
  9T/warOf7PLiTdHpS+9lTTctTjH+vqz/J0KfEUpyRaKjFXFScCAD0bKBpNgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1625124478!111497!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16648 invoked from network); 1 Jul 2021 07:27:59 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Jul 2021 07:27:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1617RtkU029709
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jul 2021 08:27:58 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 1 Jul 2021 08:27:54 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.17 -> 1.4.20
Date: Thu, 1 Jul 2021 14:37:33 +0800
Message-ID: <1625121453-86858-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

.. changelog::
    :version: 1.4.20
    :released: June 28, 2021

    .. change::
        :tags: bug, regression, orm
        :tickets: 6680

        Fixed regression in ORM regarding an internal reconstitution step for the
        :func:`_orm.with_polymorphic` construct, when the user-facing object is
        garbage collected as the query is processed. The reconstitution was not
        ensuring the sub-entities for the "polymorphic" case were handled, leading
        to an ``AttributeError``.

    .. change::
        :tags: usecase, sql
        :tickets: 6646

        Add a impl parameter to :class:`_types.PickleType` constructor, allowing
        any arbitary type to be used in place of the default implementation of
        :class:`_types.LargeBinary`. Pull request courtesy jason3gb.

    .. change::
        :tags: bug, engine
        :tickets: 5348

        Fixed an issue in the C extension for the :class:`_result.Row` class which
        could lead to a memory leak in the unlikely case of a :class:`_result.Row`
        object which referred to an ORM object that then was mutated to refer back
        to the ``Row`` itself, creating a cycle. The Python C APIs for tracking GC
        cycles has been added to the native :class:`_result.Row` implementation to
        accommodate for this case.

    .. change::
        :tags: bug, engine
        :tickets: 6665

        Fixed old issue where a :func:`_sql.select()` made against the token "*",
        which then yielded exactly one column, would fail to correctly organize the
        ``cursor.description`` column name into the keys of the result object.

    .. change::
        :tags: usecase, mysql
        :tickets: 6659

        Made a small adjustment in the table reflection feature of the MySQL
        dialect to accommodate for alternate MySQL-oriented databases such as TiDB
        which include their own "comment" directives at the end of a constraint
        directive within "CREATE TABLE" where the format doesn't have the
        additional space character after the comment, in this case the TiDB
        "clustered index" feature. Pull request courtesy Dani=C3=ABl van Eeden.

    .. change::
        :tags: bug, schema
        :tickets: 6685

        Fixed issue where passing ``None`` for the value of
        :paramref:`_schema.Table.prefixes` would not store an empty list, but
        rather the constant ``None``, which may be unexpected by third party
        dialects. The issue is revealed by a usage in recent versions of Alembic
        that are passing ``None`` for this value. Pull request courtesy Kai
        Mueller.

    .. change::
        :tags: bug, regression, ext
        :tickets: 6679

        Fixed regression in :mod:`sqlalchemy.ext.automap` extension such that the
        use case of creating an explicit mapped class to a table that is also the
        :paramref:`_orm.relationship.secondary` element of a
        :func:`_orm.relationship` that automap will be generating would emit the
        "overlaps" warnings introduced in 1.4 and discussed at :ref:`error_qzyx`.
        While generating this case from automap is still subject to the same
        caveats that the "overlaps" warning refers towards, as automap is intended
        for more ad-hoc use cases, the condition which produces the warning is
        disabled when a many-to-many relationship with this particular pattern is
        generated.

    .. change::
        :tags: bug, regression, orm
        :tickets: 6678

        Adjusted :meth:`_orm.Query.union` and similar set operations to be
        correctly compatible with the new capabilities just added in
        :ticket:`6661`, with SQLAlchemy 1.4.19, such that the SELECT statements
        rendered as elements of the UNION or other set operation will include
        directly mapped columns that are mapped as deferred; this both fixes a
        regression involving unions with multiple levels of nesting that would
        produce a column mismatch, and also allows the :func:`_orm.undefer` option
        to be used at the top level of such a :class:`_orm.Query` without having to
        apply the option to each of the elements within the UNION.

    .. change::
        :tags: bug, sql, orm
        :tickets: 6668

        Fixed the class hierarchy for the :class:`_schema.Sequence` and the more
        general :class:`_schema.DefaultGenerator` base, as these are "executable"
        as statements they need to include :class:`_sql.Executable` in their
        hierarchy, not just :class:`_roles.StatementRole` as was applied
        arbitrarily to :class:`_schema.Sequence` previously. The fix allows
        :class:`_schema.Sequence` to work in all ``.execute()`` methods including
        with :meth:`_orm.Session.execute` which was not working in the case that a
        :meth:`_orm.SessionEvents.do_orm_execute` handler was also established.

    .. change::
        :tags: bug, orm
        :tickets: 6538

        Adjusted the check in the mapper for a callable object that is used as a
        ``@validates`` validator function or a ``@reconstructor`` reconstruction
        function, to check for "callable" more liberally such as to accommodate
        objects based on fundamental attributes like ``__func__`` and
        ``__call___``, rather than testing for ``MethodType`` / ``FunctionType``,
        allowing things like cython functions to work properly. Pull request
        courtesy Mi=C5=82osz Stypi=C5=84ski.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.17.bb =3D> python3-sqlalchemy_1.4.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.17.bb =3D> python3-sqlalchemy_1.4.20.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
index 5b881ea0b6..b96cdd3ed8 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.sqlalchemy.org/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] =3D "651cdb3adcee13624ba22d5ff3e96f91e16a115d2ca489ddc16a8e4c217e8509"
+SRC_URI[sha256sum] =3D "38ee3a266afef2978e82824650457f70c5d74ec0cadec1b10fe5ed6f038eb5d0"
 
 PYPI_PACKAGE =3D "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1

